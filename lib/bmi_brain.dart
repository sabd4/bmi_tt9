import 'dart:math';

import 'package:flutter/material.dart';

class BMIbrain {
  late String _gender;
  double _hight = 155;
  int _wieght = 50;
  int _age = 23;
  double result = 0;
  String type = "";
  List<String> messages = [
    "You can put on weight by eating small meals frequently throughout the day",
    "You have a normal body weight. Good job!",
    "You can lose all the over weight by sport"
  ];
  String m = "";
  Color tcolor = Colors.green;
  String range = "";

  setGender(String g) {
    _gender = g;
  }

  String getGender() {
    return _gender;
  }

  setHieght(double h) {
    _hight = h;
  }

  double getHieght() {
    return _hight;
  }

  setWieght(int w) {
    _wieght = w;
  }

  int getWieght() {
    return _wieght;
  }

  setAge(int a) {
    _age = a;
  }

  int getAge() {
    return _age;
  }

  calcBmi() {
    result = (_wieght / pow((_hight / 100), 2)).truncateToDouble();
    if (result < 18.5) {
      type = "Under weight";
      tcolor = Colors.red;
      range = "0 - 18.5";
      m = messages[0];
    } else if (result >= 18.5 && result <= 24.9) {
      type = "Normal";
      tcolor = Colors.green;
      range = "18.5 - 24.9";
      m = messages[1];
    } else {
      type = "Over weight";
      tcolor = Colors.red;
      range = "25 > ";
      m = messages[2];
    }
  }

  reset() {
    _age = 23;
    _wieght = 50;
    _hight = 155;
    result = 0;
  }
}
