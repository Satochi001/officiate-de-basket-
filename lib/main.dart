
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
  String Score = '00';

  void AddScore(String team) {
    setState(() {
      if(team == 'a'){
        teamA ++;
        String score;
        Score = teamA <= 9 ? "0" + teamA.toString(): teamA.toString();
        Score;
        print(Score);

      }else if(team =='b'){
        teamB ++ ;
        String score;
        score = teamB <= 9 ? "0 " + teamB.toString(): teamB.toString();
        score;
        print(score);
      }


    });
  }


// function to remove score
  void RemoveScore (String team){
    if(team == 'a'){
      if(teamA < 0){
        teamA--;
      }else {
        teamA;
      }
    }else if(team == 'b'){
      if(teamB > 0){
        teamB--;
      }else{
        teamB;
      }

    }else{
      team;
    }
  }
  @override
  Widget build(BuildContext context) {
   return Center(
     child: Column(
       children: [
         const Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Expanded(
                 child: Column(
                   children: [
                     Text(
                       "Team A",

                     ),

                     const Text(''),
                   ],
                 )
             ),
             Spacer(),
             Expanded(
                 child: Column(
                   children: [
                     Text("Team B"),
                     Text("00"),
                   ],

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
                   AddScore("a");
                 },
                 child: const Text("-")
            ),
             Spacer(),
             ElevatedButton(
                 onPressed:(){},
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





