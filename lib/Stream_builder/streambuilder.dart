import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class StreamBuilMain extends StatefulWidget {
  const StreamBuilMain({super.key});

  @override
  State<StreamBuilMain> createState() => _StreamBuilMainState();
}

class _StreamBuilMainState extends State<StreamBuilMain> {
  Stream<int> singleSubscriptionStream() {
    var singleCtrlStream = StreamController<int>();
    singleCtrlStream.add(10);
    singleCtrlStream.add(20);
    singleCtrlStream.close();
    return singleCtrlStream.stream;
  }

  Stream<int> getBroadcastStream() {
    final controller = StreamController<int>.broadcast();

    // Emit data repeatedly
    Future.delayed(Duration(seconds: 1), () => controller.add(1));
    Future.delayed(Duration(seconds: 2), () => controller.add(2));
    Future.delayed(Duration(seconds: 3), () {
      controller.add(3);
      controller.close();
    });

    return controller.stream;
  }

  @override
  void initState() {
    // var stream = singleSubscriptionStream();
    var stream2 = getBroadcastStream();

    stream2.listen((event) {
      print("the stream event is ${event}");
    });
    stream2.listen((event) {
      print("the stream event is 2 ${event}");
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Expanded(child: Container(color: Colors.red))]),
    );
  }
}
