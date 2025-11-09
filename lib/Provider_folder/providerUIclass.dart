import 'package:flutter/material.dart';
import 'package:learn_provider/FutureBuilder/FutureBuilder.dart';
import 'package:learn_provider/Provider_folder/counterProvider.dart';
import 'package:provider/provider.dart';

class ProvClassUI extends StatelessWidget {
  const ProvClassUI({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counterprovider>(context);
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.count.toString(),style: TextStyle(fontSize: 100),),
            GestureDetector(
              onTap: () {
                counter.incrementCount();
              },
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FutureBuilderTest();
                },));
              },
              child: Container(
                color: Colors.green,
                height: 100,
                width: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}