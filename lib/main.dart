import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mainn/layout/home_layout.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:mainn/modules/counter/CounterScreen.dart';
import 'package:mainn/modules/login/LoginScreen.dart';
import 'package:mainn/modules/messenger/MessengerScreen.dart';
import 'package:mainn/modules/tasks/tasks.dart';
import 'package:mainn/modules/users/UsersScreen.dart';
import 'package:mainn/modules/bmi_result/bmiResult.dart';
import 'package:mainn/modules/bmi/bmiScreen.dart';
import 'package:mainn/shared/bloc_observer.dart';
void main(){
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      HomeLayout(),
    );
  }
}