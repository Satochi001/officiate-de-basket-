import 'package:flutter/material.dart';

class myProvider  extends ChangeNotifier{
  String AddDegit(int score){
    return score  <=9 ? "0${score}" : "${score}";
  }
}
