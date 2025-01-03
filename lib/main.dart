
import 'package:flutter/material.dart';
import 'dart:async';
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
//provider  widget

class myProvider  extends ChangeNotifier{
  String AddDegit(int score){
    return score  <=9 ? "0${score}" : "${score}";
  }
}

//widget for displaying timer and timer functionality

class TimerWidget extends StatefulWidget{
  const TimerWidget({
    super.key

});

  @override
  _timerState createState() => _timerState();
}
class _timerState extends State<TimerWidget>{
  bool isPaused = false;
  String displayText = "start";
  int seconds = 0;
  int minutes = 0;
   Timer ? _timer;
  late TextEditingController _controllerMinutes = TextEditingController();
  late TextEditingController _controllerSeconds = TextEditingController();
  final myProviderInstance = myProvider();




  void timers(){
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer){
      print("Timer ticked");
      setState(() {
        if (seconds > 0) {
          seconds --;
          _controllerSeconds.text = seconds.toString();
          print(seconds);
          
        } else if (minutes > 0){
          minutes --;
          seconds = 59;
          _controllerMinutes.text = minutes.toString();
          print(minutes);
        }
        else if(seconds == 0 && minutes == 0){
          _timer?.cancel();
        }
        else{
          _timer?.cancel();

        }

        _controllerMinutes = TextEditingController(text: '${myProviderInstance.AddDegit(minutes)}');
        _controllerSeconds = TextEditingController(text: '${myProviderInstance.AddDegit(seconds)}');
        displayText ='pause';
      });
    });
  }

  @override
  void dispose() {

    _timer?.cancel();
    super.dispose();
  }

  @override


  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: [
           Row(
            children: [
              Flexible(child:
              TextField(
                controller: _controllerMinutes,
                decoration: const InputDecoration(
                ),
                keyboardType: TextInputType.number,
                onChanged:(value){
                  setState(() {
                    minutes = int.tryParse(value) ?? 0 ;
                  });

                },
              ),


              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child:
              TextField(
                controller: _controllerSeconds,
                decoration: const InputDecoration(

                ),
                keyboardType: TextInputType.number,
                onChanged: (value){
                  seconds = int.tryParse(value) ?? 0 ;

                },
              ),
              )


            ],
          ),

          TextButton(
            onPressed: (){
                setState(() {
                  isPaused = !isPaused;
                    displayText = isPaused ? "start" : "paused";
                });
                if(!isPaused){
                  timers();
                }else{
                  if(_timer != null && _timer!.isActive)

                  _timer?.cancel();

                }
            },
             child: Text(displayText),
          ),
        ],
      ),
   

    );

  }
}

//socre board widget;

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
   return Center(
     child: Consumer<myProvider>
       (builder :
         (context, myProvider, child)=>
             Column(
               children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Expanded(
                       child: GestureDetector(
                           onTap : (){
                             selectedTeams("a");
                           },
                           child: Column(
                             children: [
                               const Text(
                                 "Team A",
                               ),

                               Text(myProvider.AddDegit(teamA)),
                             ],
                           )

                       ),
                     ),
                     Spacer(),
                     Expanded(
                         child: GestureDetector(
                             onTap: (){
                               selectedTeams("b");
                               print("this is the second click");

                             },
                             child: Column(
                               children: [
                                 Text("Team B"),
                                 Text(myProvider.AddDegit(teamB)),
                               ],

                             )

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
                                 print("this is actually working");
                               },
                               child: const Text("-")
                           ),
                           Spacer(),
                           ElevatedButton(
                               onPressed:(){
                                 AddScore();
                                 print("this is actually working 1");
                               },
                               child: const Text("+")
                           ),

                         ]
                     )
                 ),

               ],

             )

     )

   );

  }

}





