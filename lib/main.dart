
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:my_flutter_app/providers%20/widgets0-provider.dart';
import 'package:my_flutter_app/scoreBoard%20/track-score.dart';
import 'package:my_flutter_app/timer%20/time-tracker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context ) => myProvider(),
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'samies bukar',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget
  build(BuildContext  context){
    return 
        const Scaffold(
            body: Center(
              child: Column(
                children: [
                     ScoreBoard(),
                     Expanded(
                         child: TimerWidget(),

                     ),

                ],

              ),

            ),

        );
  }
}

