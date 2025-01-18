import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../providers /widgets0-provider.dart';



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
    return SafeArea(
      child:  Padding(
        padding:
        const EdgeInsets.symmetric(
            vertical: 20, horizontal: 60
        ),

        child: Column(
        children: [
          Row(
            children: [
              Expanded(child:
              TextField(
                style: GoogleFonts.robotoMono(fontSize: 80),

                controller: _controllerMinutes,
                decoration: const
                InputDecoration(
                  hintText: "00",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
                ),
                keyboardType: TextInputType.number,
                onChanged:(value){
                  setState(() {
                    minutes = int.tryParse(value) ?? 0 ;
                  });
                },
              ),
              ),
              const Spacer(),
              Flexible(
                child:
                TextField(
                  style: GoogleFonts.robotoMono(fontSize: 80),

                  controller: _controllerSeconds,
                  decoration: const InputDecoration(
                    hintText: "00",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),


                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    seconds = int.tryParse(value) ?? 0 ;

                  },
                ),
              )


            ],
          ),

          Row(
            children: <Widget>[
              TextButton(
                onPressed: (){},
                child: Text("Reset"),),
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
            ]
        ),

      ),


    );

  }
}





