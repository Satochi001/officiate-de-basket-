import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers /widgets0-provider.dart';
import '../widgets /track-fouls.dart';



class ScoreBoard extends StatefulWidget{
  const ScoreBoard({
    super.key

  });
  @override
  _ScoreBoardState  createState() => _ScoreBoardState();
}


class  _ScoreBoardState extends State<ScoreBoard>{




  // scores functionality in dart .

  //initializer for both teams
  int teamA = 0;
  int teamB = 0;
  String selectedTeam = '';


  void selectedTeams( String team ){
    setState(() {
      selectedTeam = team;
    });

  }

  void AddScore() {
    setState(() {
      if(selectedTeam == "a"){
        print(teamA);
        teamA++;

      } if(selectedTeam == "b"){
        print(teamB);
        teamB++;

      }else {
        return ;
      }
    });
  }


// function to remove score
  void RemoveScore (){
    setState((){
      if(selectedTeam=="a"){
        if(teamA <= 0){
          teamA;
        }
        teamA--;
        print(teamA);
      }if(selectedTeam == "b"){
        if(teamB <= 0){
          teamB;
        }
        teamB--;
        print(teamB);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color:  Colors.green,
      margin: const EdgeInsets.only(
        bottom: 60
      ),
    child: Column(
      children: [
    Consumer<myProvider>(builder:
    (context, myProvider, child)=>
   Row (
     mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Column(
                  children:[
                    Text(
                      'teamA',
                      style: GoogleFonts.robotoMono(fontSize: 20),
                    ),
                    GestureDetector(
                        onTap:(){
                          selectedTeams("a");
                        },
                        child : Text(
                          myProvider.AddDegit(teamA),
                          style: GoogleFonts.robotoMono(fontSize: 120),
                        )
                    )
                  ]
              ),
              SizedBox(width: 120),
              Column(
                children: [
                  Text(
                    'teamB',
                    style : GoogleFonts.robotoMono(fontSize: 20),
                  ),
                  GestureDetector(
                    onTap:(){
                      selectedTeams('b');
                    },
                    child: Text(
                      myProvider.AddDegit(teamB),
                      style: GoogleFonts.robotoMono(fontSize: 120),

                    ),

                  )
                ],

              )

            ]
        )
    ),
        const SizedBox(
          height: 30,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  RemoveScore();
                },
                child: const Text("-")
            ),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: (){
                  AddScore();
                },
                child: const Text("+")),
          ],
        ),
        const SizedBox(
          height: 30,
        ),

      ],
    )
    );
  }
}


