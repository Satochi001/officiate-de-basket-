
import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets%20/track-fouls.dart';
import 'scoreBoard /track-score.dart';
import 'timer /time-tracker.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext  context){
    return Scaffold(
      body: LayoutBuilder(
     builder: (BuildContext context, BoxConstraints constraints){
       return const  Center(
         child: SingleChildScrollView(
           padding: EdgeInsets.symmetric(horizontal: 100),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center, // Center vertically
             children: [
               ScoreBoard(),

               Row(
                 children: [
                   Expanded(
                       child:
                       SizedBox(
                         child:
                         FoulTrackWidget(),
                       )
                   ),
                   Spacer(),
                   Expanded(
                     child:  SizedBox(
                         child:  FoulTrackWidget()
                     ),
                   ),
                 ],
               ),

               TimerWidget(),

             ],

           ),

         ),
       );

     },
     )

    );

  }
}

