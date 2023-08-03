
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainn/shared/components/components.dart';
import 'package:mainn/shared/cubit/cubit.dart';
import 'package:mainn/shared/cubit/states.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context,state){},
      builder: (context, state){
        var tasks = AppCubit.get(context).newTasks;
        return Scaffold(
          backgroundColor: Colors.black,
          body: TaskBuilder(tasks: tasks),
        );
      },
    );
  }
}
