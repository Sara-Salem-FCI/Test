import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainn/layout/news_app/news_layout.dart';
import 'package:mainn/layout/todo_app/todo_layout.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:mainn/modules/counter/CounterScreen.dart';
import 'package:mainn/modules/login/LoginScreen.dart';
import 'package:mainn/modules/messenger/MessengerScreen.dart';
import 'package:mainn/modules/tasks/tasks.dart';
import 'package:mainn/modules/users/UsersScreen.dart';
import 'package:mainn/modules/bmi_result/bmiResult.dart';
import 'package:mainn/modules/bmi/bmiScreen.dart';
import 'package:mainn/shared/bloc_observer.dart';
import 'package:mainn/shared/cubit/cubit.dart';
import 'package:mainn/shared/cubit/states.dart';
import 'package:mainn/shared/network/local/cache_helper.dart';
import 'package:mainn/shared/network/remote/dio_helper.dart';

import 'layout/news_app/cubit/cubit.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();
 bool? isDark = CacheHelper.getBoolean(key : 'isDark');
  runApp(MyApp(isDark!));
}
class MyApp extends StatelessWidget{
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(fromShared : isDark,),),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state){},
        builder: (context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 18,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                bodyMedium: TextStyle(
                  color: Colors.grey[800],
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 18,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Colors.black,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                unselectedItemColor: Colors.grey[600],
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
                bodyMedium: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light ,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}