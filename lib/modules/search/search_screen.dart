import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainn/layout/news_app/cubit/cubit.dart';
import 'package:mainn/layout/news_app/cubit/states.dart';
import 'package:mainn/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextForm(
                  text: 'Search',
                  type: TextInputType.text,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  preIcon: Icons.search,
                  controller: search,
                  password: false,),
              ),
              Expanded(child: articleBuilder(list, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
