import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Plearn extends StatelessWidget {
  const Plearn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.green,
          title: Text("MY APP BAR"),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.orange,
                height: 6.sh,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.yellow,
                        child: Center(
                          child: Container(
                            color: Colors.deepOrange,
                            height: 3.sh,
                            width: 150,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics:AlwaysScrollableScrollPhysics(),
                  // reverse: false,
                  child: Container(
                    color: Colors.amber,
                    // height: 1000,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.pink,
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("Hello Sizer",style: TextStyle(fontSize: 20.sp),)),
                        ),
                         Container(
                          color: Colors.purple,
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
