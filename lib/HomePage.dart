
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
    return Scaffold (
    body: Container(
        child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
         return SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Stack(
                 children :[
                   const ScoreBoard(),
                   Positioned(
                       top: 290,
                       child: Row(
                         children: [
                           Container(
                             decoration: const BoxDecoration(
                               borderRadius : BorderRadius.only(
                                   bottomLeft: Radius.circular(10),
                                   bottomRight: Radius.circular(0)

                               ),
                               color:  Colors.greenAccent,

                             ),
                             width: 300,
                             child:  FoulTrackWidget(),
                           ),


                           Container(
                             decoration: const BoxDecoration(
                               borderRadius : BorderRadius.only(
                                   bottomLeft: Radius.circular(0),
                                   bottomRight: Radius.circular(10)

                               ),
                               color:  Colors.greenAccent,

                             ),
                             width: 200,
                             child: FoulTrackWidget(),

                           )
                         ],
                       ),
                   ),



                 ]
               ),

               TimerWidget(),


             ],
           ),

            );
          }
        )
    )

    );

  }
}

