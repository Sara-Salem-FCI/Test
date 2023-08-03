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
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  List<Widget> screens = [
    Tasks(),
    Done(),
    Archive(),
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
          getDataFromDatabase(database);
          print('database opened');
        }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    }) as Database;
  }
  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn){
      return txn.rawInsert('INSERT INTO tasks(title, date, time, status) VALUES ("$title","$date","$time","new")').then((value) {
        print('$value inserted successflly');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error){
        print('error ${error.toString()}');
      });
    });

  }
  void getDataFromDatabase (database)  {
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];
    database.rawQuery('SELECT * FROM tasks').then((value)
    {
    value.forEach((element) {
      if(element['status'] == 'new') 
        newTasks.add(element);
      else if(element['status'] == 'done')
        doneTasks.add(element);
      else archivedTasks.add(element);
    });
    emit(AppGetDatabaseState());
    });
  }
  void updateData({
    required String status,
    required int id,
}) async{
     database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ? ',
      [status, id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
     });
  }

  void deleteData({
    required int id,
  }) async{
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ? ',
      [id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
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