
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
  String selectedTeam = "";

  void updateScore(String team){
    setState(() {
      selectedTeam = team;


    });

  }

  void increament(){
    setState(() {
      if(selectedTeam =="a"){
        teamA++;
        print(teamA);
      }
      else if(selectedTeam =="b"){
        teamB++;
      }

    });

  }

  String updateOneDigit(int score) {
    return score <= 9 ? "0$score" : "$score";
  }

// function to remove score
  void RemoveScore (){
    setState(() {
      if(selectedTeam == "a"){
        teamA--;
      }
      else if(selectedTeam == "b"){
        teamB--;

      }

    });
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
                 child: Column(
                   children: [
                     const Text("Team A"),
                     Text(
                       updateOneDigit(teamA),
                     ),
                   ],
                 )
             ),
             const Spacer(),
             Expanded(
                 child: Column(
                   children: [
                     const Text("Team B"),
                     Text(
                         updateOneDigit(teamB),

                     )
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
                   RemoveScore();

                 },
                 child: const Text("-")
            ),
             const Spacer(),
             ElevatedButton(
                 onPressed:(){
                   print("iiiii");
                   increament();
                 },
                 child: const Text("+")
             ),

           ]
         )
             )





       ],

     )

   );

  }

}





