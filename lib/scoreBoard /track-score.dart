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
  @override
  Widget build(BuildContext context) {
    return Column (
      children :[
        Container(
         child:  Consumer<myProvider>(
            builder: (context, myProvider, child) => Column(
                children: [
                  Row( // Row for Team A and Team B
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectedTeams("a");
                          },
                          child: Column(
                            children: [
                              const Text("Team A"),
                              Text(
                                myProvider.AddDegit(teamA),
                                style: GoogleFonts.robotoMono(fontSize: 80),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectedTeams("b");
                            print("this is the second click");
                          },
                          child: Column(
                            children: [
                              const Text("Team B"),
                              Text(
                                myProvider.AddDegit(teamB),
                                style: GoogleFonts.robotoMono(fontSize: 80),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding( // Padding and buttons are now outside the Row
                    padding: const EdgeInsets.symmetric(horizontal: 180, vertical: 50),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            RemoveScore();
                            print("this is actually working");
                          },
                          child: const Text("-"),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            AddScore();
                            print("this is actually working 1");
                          },
                          child: const Text("+"),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),

        ),
    ],
    );
  }
}


