import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainn/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/archive/archieve.dart';
import '../../modules/done/done.dart';
import '../../modules/tasks/tasks.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit () : super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);
  int curindex= 0;
  late Database database;
  List<Map> tasks = [];
  List<Widget> screens = [
    Tasks(),
    Done(),
    Archieve(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archieved Tasks',
  ];
  void ChangeIndex(int index){
    curindex = index;
    emit(AppChangeButNavBarState());
  }
  void createDatabase() async {
    database = await openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database , version){
          print('database created');
          database.transaction((txn) async {
            await txn.execute('CREATE TABLE TASKS(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)');
          }).then((value){
            print('table created');
          }).catchError((error){
            print('error ${error.toString()}');
          });
        },
        onOpen: (database){
          getDataFromDatabase(database).then((value)
          { tasks = value;
          print(tasks);
          emit(AppGetDatabaseState());
          });
          print('database opened');
        }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    }) as Database;
  }

  /*void createDatabase() {
    database =  openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database , version){
          print('database created');
          database.execute('CREATE TABLE TASKS(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value){
            print('table created');
          }).catchError((error){
            print('error ${error.toString()}');
          });
        },
        onOpen: (database){
         getDataFromDatabase(database).then((value)
         { tasks = value;
           print(tasks);
         emit(AppGetDatabaseState());
         });
          print('database opened');
        }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    }) as Database;
  }*/
  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
   await database.transaction((txn){
      return txn.rawInsert('INSERT INTO tasks(title, date, time, status) VALUES ("$title","$date","$time","new")').then((value) {
        print('$value inserted successflly');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database).then((value)
        { tasks = value;
        print(tasks);
        emit(AppGetDatabaseState());
        });
      }).catchError((error){
        print('error ${error.toString()}');
      });
    });
  }
  Future<List<Map>> getDataFromDatabase (database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
  bool isButSheetShow = false;
  IconData fabIcon = Icons.add;
  void ChangeBottomSheetState({
    required bool isShow,
    required IconData icon,
}){
    isButSheetShow = isShow;
    fabIcon = icon;
    emit(AppChangeButSheetBarState());
  }
}