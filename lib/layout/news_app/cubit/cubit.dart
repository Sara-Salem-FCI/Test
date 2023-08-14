import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainn/layout/news_app/cubit/states.dart';
import 'package:mainn/modules/business/business_screen.dart';
import 'package:mainn/modules/science/sciece_screen.dart';
import 'package:mainn/modules/settings_screen/settings_screen.dart';
import 'package:mainn/modules/sports/sports_screen.dart';
import 'package:mainn/shared/cubit/states.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business,),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball_rounded,),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science,),
      label: 'Science',
    ),

  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changeBottomNavBar( int index){
    currentIndex = index;
    if(index==1) getSports();
    if(index==2) getSports();

    emit(NewsBottomNavStates());
  }
  List<dynamic> business = [];
  void getBusiness (){
    emit(NewsGetBusinessLoadingStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'business',
        'apiKey':'e1a00d07c8aa4328affc11faa3c772b6',
      },
    ).then((value) {
      //print(value?.data['articles'].toString());
      business = value?.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorStates(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports (){
    emit(NewsGetSportsLoadingStates());
    if(sports.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'sports',
          'apiKey':'e1a00d07c8aa4328affc11faa3c772b6',
        },
      ).then((value) {
        //print(value?.data['articles'].toString());
        sports = value?.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessStates());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorStates(error.toString()));
      });
    } else {  emit(NewsGetSportsSuccessStates());}
  }

  List<dynamic> science = [];
  void getScience (){
    emit(NewsGetScienceLoadingStates());
    if(science.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'e1a00d07c8aa4328affc11faa3c772b6',
        },
      ).then((value) {
        //print(value?.data['articles'].toString());
        science = value?.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessStates());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorStates(error.toString()));
      });
    } else {emit(NewsGetScienceSuccessStates());}

  }

  List<dynamic> search = [];
  void getSearch (String value){
    emit(NewsGetScienceLoadingStates());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'e1a00d07c8aa4328affc11faa3c772b6',
      },
    ).then((value) {
      //print(value?.data['articles'].toString());
      search = value?.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearcheSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearcheErrorStates(error.toString()));
    });
  }
}
