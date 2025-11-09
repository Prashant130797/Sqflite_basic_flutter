import 'package:flutter/material.dart';

import 'package:learn_provider/Provider_folder/counterProvider.dart';
import 'package:learn_provider/Sqflite/learmSqflite.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Counterprovider(),)
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var counter = Provider.of<Counterprovider>(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const DartNewSqfliState(),
        );
      },
    );
  }
}
