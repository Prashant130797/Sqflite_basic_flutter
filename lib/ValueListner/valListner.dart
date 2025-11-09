import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ValueListnerTest extends StatelessWidget {
  const ValueListnerTest({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> boolValue = ValueNotifier<bool>(true);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 10.sh),
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
                child: ValueListenableBuilder<Object>(
                  valueListenable: boolValue,
                  builder: (context, value, child) {
                    return value == true
                        ? Text("Error", style: TextStyle(color: Colors.red))
                        : Text(
                          "not error",
                          style: TextStyle(color: Colors.green),
                        );
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
