
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
              child: ScoreBoard(),
            ),

        );
  }
}


class ScoreBoard extends StatefulWidget{
   const ScoreBoard({
     super.key

});
   @override
  _ScoreBoardState  createState() => _ScoreBoardState();
}


class  _ScoreBoardState extends State<ScoreBoard>{

  // scores functionality in dart .

  //initiazer for both teams
  int teamA = 0;
  int teamB = 0;
  String increment = "";


  String selectedTeam(String team) {
    increment = team ;
    if(team == "a"){
      increment;
    }else if(team == "b"){
      increment;
    }
    return team ;

  }

  void updateTeamscore(){
    if(increment == "a"){
      teamA++;
      print('team A $teamA');
    }else if(increment == "b"){
      teamB ++;
      print('team b $teamB');
    }

  }
  
  String formatScore (int Score){
    return Score <= 9 ? "0${Score}": "${Score}";
  }










  @override
  Widget build(BuildContext context) {
   return Center(
     child: Column(
       children: [
         Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Expanded(
                 child: GestureDetector(
                   onTap: (){
                     selectedTeam("a");
                   },
                   child:  Column(
                       children: [
                         const Text(
                           "Team A",
                         ),
                         Text("${formatScore(teamA)}"),
                       ],
                     )
                 ),
             ),
             const Spacer(),
             Expanded(
               child: GestureDetector(
                 onTap: (){
                   selectedTeam("b");
                 },
                 child:  Column(
                   children: [
                      Text("Team B"),
                     Text("${formatScore(teamB)}"),
                   ],
                    ),
                 )
             ),
           ],
         ),
         Padding(
             padding: const
             EdgeInsets.symmetric(horizontal: 180, vertical: 50),
             child: Row(
           children:[
             ElevatedButton(
                 onPressed:(){
                   updateTeamscore();
                 },
                 child: const Text("-")
            ),
             Spacer(),
             ElevatedButton(
                 onPressed:(){
                   updateTeamscore();
                 },
                 child: const Text("+")
             ),

           ]
         )
             ),

       ],

     )

   );

  }

}






