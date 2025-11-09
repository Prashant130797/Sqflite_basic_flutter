import 'package:flutter/material.dart';
import 'package:learn_provider/Provider_folder/counterProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FutureBuilderTest extends StatelessWidget {
  const FutureBuilderTest({super.key});

  @override
  Widget build(BuildContext context) {
  
    var counter = Provider.of<Counterprovider>(context);
    ValueNotifier<bool> boolValue = ValueNotifier<bool>(true);

    Future<String> asynFuturemethod() async {
      await Future.delayed(Duration(seconds: 5));
      return "Value Loaded";
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 10.sh),
            GestureDetector(
              onTap: () {
                counter.incrementCount();
              },
              child: Container(
                color: Colors.pink,
                width: 100.sw,
                height: 10.sh,
              ),
            ),
            Container(
              color: Colors.white,
              width: 100.sw,
              height: 10.sh,
              child: TextFormField(
                controller: TextEditingController(),
                onChanged: (value) {
                  if (value.length <= 5) {
                    boolValue.value = true;
                  } else {
                    boolValue.value = false;
                  }
                },
                validator: (value) {
                  return "demotest";
                },
              ),
            ),
            Center(
              child: Container(
                height: 10.sh,
                width: 100.sw,
                child: FutureBuilder<String>(
                  future: asynFuturemethod(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        "Waiting",
                        style: TextStyle(color: Colors.purple),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error", style: TextStyle(color: Colors.red));
                    } else if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: TextStyle(color: Colors.green),
                      );
                    } else {
                      return Text(
                        "No data Found",
                        style: TextStyle(color: Colors.pink),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
