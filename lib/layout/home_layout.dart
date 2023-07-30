import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mainn/modules/archive/archieve.dart';
import 'package:mainn/modules/done/done.dart';
import 'package:mainn/modules/tasks/tasks.dart';
import 'package:mainn/shared/components/components.dart';
import 'package:mainn/shared/cubit/cubit.dart';
import 'package:mainn/shared/cubit/states.dart';

import 'package:sqflite/sqflite.dart';
import '../shared/components/constants.dart';
class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var title = TextEditingController();
  var time = TextEditingController();
  var date = TextEditingController();
  @override
  Widget build(BuildContext context) {
  return BlocProvider(
    create: (BuildContext context) => AppCubit()..createDatabase(),
    child: BlocConsumer<AppCubit, AppStates>(
     listener: (BuildContext context, AppStates state){
       if ( state is AppInsertDatabaseState){
         Navigator.pop(context);
       }
     },
      builder: (BuildContext context , AppStates state ){
        AppCubit cubit = AppCubit.get(context);
       return Scaffold(
         key: scaffoldKey,
         appBar: AppBar(
           backgroundColor: Colors.grey[900],
           title: Text(
             cubit.titles[cubit.curindex],
           ),
         ),
         body: Container(
             color: Colors.black,
             child: ConditionalBuilder(
               condition: true ,
               builder: (context) => cubit.screens[cubit.curindex],
               fallback: (context) => Center(child: CircularProgressIndicator()),
             )
         ),
         floatingActionButton: FloatingActionButton(
           backgroundColor: Colors.green[200],
           onPressed: () {
             if(cubit.isButSheetShow){
               if(formKey.currentState!.validate()){
                 cubit.insertToDatabase(title: title.text, time: time.text, date: date.text);
               }
             }
             else {
               scaffoldKey.currentState?.showBottomSheet((context) =>
                   Container(
                     color: Colors.grey[900],
                     padding: EdgeInsets.all(20,),
                     child: Form(
                       key: formKey,
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           EnabelTextForm(
                               text: 'Task Title' ,
                               LabelTextColor: Colors.grey,
                               TextColor: Colors.white,
                               BorderColor: Colors.grey,
                               FocusBorderColor: Colors.green[200],
                               CursorColor: Colors.green[200],
                               type: TextInputType.text,
                               preIcon: Icons.title,
                               PreIconColor: Colors.grey,
                               controller: title,
                               validator: (String value){if(value.isEmpty){return 'title must not be empty';}return null;},
                               password: false),
                           SizedBox(height: 13,),
                           EnabelTextForm(
                               text: 'Task Time' ,
                               LabelTextColor: Colors.grey,
                               onTap: (){
                                 showTimePicker(
                                     builder: (BuildContext context, Widget? child) {
                                       return Theme(
                                         data: ThemeData.dark().copyWith(
                                           colorScheme: ColorScheme.light(
                                             primary: Colors.green[200]!,
                                             onPrimary: Colors.white,
                                             surface: Colors.grey[900]!,
                                             onSurface: Colors.white,
                                           ),
                                         ),
                                         child: child!,
                                       );},
                                     context: context,
                                     initialTime: TimeOfDay.now()).then((value) {
                                   time.text = value?.format(context).toString() as String;
                                   print(value?.format(context));
                                 });
                               },
                               TextColor: Colors.white,
                               BorderColor: Colors.grey,
                               FocusBorderColor: Colors.green[200],
                               CursorColor: Colors.green[200],
                               type: TextInputType.datetime,
                               preIcon: Icons.access_time,
                               PreIconColor: Colors.grey,
                               controller: time,
                               validator: (String value){if(value.isEmpty){return 'time must not be empty';}return null;},
                               password: false),
                           SizedBox(height: 13,),
                           EnabelTextForm(
                               text: 'Task Date' ,
                               LabelTextColor: Colors.grey,
                               onTap: (){
                                 showDatePicker(
                                     builder: (BuildContext context, Widget? child) {
                                       return Theme(
                                         data: ThemeData.dark().copyWith(
                                           colorScheme: ColorScheme.light(
                                             primary: Colors.green[200]!,
                                             onPrimary: Colors.black,
                                             surface: Colors.grey[900]!,
                                             onSurface: Colors.white,
                                           ),
                                         ),
                                         child: child!,
                                       );},
                                     context: context,
                                     initialDate: DateTime.now(),
                                     firstDate: DateTime.now(),
                                     lastDate: DateTime.parse('2024-08-02')).then((value) {
                                   print(DateFormat.yMMMd().format(value!),);
                                   date.text = DateFormat.yMMMd().format(value!);
                                 });
                               },
                               TextColor: Colors.white,
                               BorderColor: Colors.grey,
                               FocusBorderColor: Colors.green[200],
                               CursorColor: Colors.green[200],
                               type: TextInputType.datetime,
                               preIcon: Icons.calendar_month,
                               PreIconColor: Colors.grey,
                               controller: date,
                               validator: (String value){if(value.isEmpty){return 'date must not be empty';}return null;},
                               password: false),
                         ],
                       ),
                     ),
                   ),
               ).closed.then((value) {
                 cubit.ChangeBottomSheetState(isShow: false, icon: Icons.add,);
               });
               cubit.ChangeBottomSheetState(isShow: true, icon: Icons.done,);
             }
           },
           child: Icon(
             cubit.fabIcon,
             color: Colors.black,
             size: 30,
           ),
         ),
         bottomNavigationBar: BottomNavigationBar(
           unselectedItemColor: Colors.grey[400],
           unselectedLabelStyle: TextStyle(
             color: Colors.white,
           ),
           selectedItemColor: Colors.green[200],
           type: BottomNavigationBarType.fixed,
           currentIndex: cubit.curindex,
           backgroundColor: Colors.black,
           onTap: (index){
             cubit.ChangeIndex(index);
           },
           items: [
             BottomNavigationBarItem(
               icon: Icon(
                 Icons.menu,
               ),
               label: 'Tasks',
             ),
             BottomNavigationBarItem(icon:
             Icon(
               Icons.check_box,
             ),
               label: 'Done',
             ),
             BottomNavigationBarItem(icon:
             Icon(
               Icons.archive_outlined,
             ),
               label: 'Archived',
             ),
           ],
         ),
       );
      },
    ),
  );
  }
  }


