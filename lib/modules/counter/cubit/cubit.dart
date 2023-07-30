import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainn/modules/counter/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterInitialState());
  static CounterCubit get(context) => BlocProvider.of(context);
  int counter =1;
  void minus (){
    counter--;
    emit(CounterMinusState(counter));
  }
  void plus (){
    counter++;
    emit(CounterPlusState(counter));
  }
}