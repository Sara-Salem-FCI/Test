import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainn/shared/components/components.dart';
import 'package:mainn/shared/cubit/cubit.dart';
import 'package:mainn/shared/cubit/states.dart';

import '../../shared/components/constants.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context,state){},
      builder: (context, state){
        var tasks = AppCubit.get(context).tasks;
        return Scaffold(
          backgroundColor: Colors.black,
          body: ListView.separated(
            itemBuilder: (context , index) => Task(tasks[index]),
            separatorBuilder: (context , index) => Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            itemCount: tasks.length,),
        );
      },
    );
  }
}
