import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainn/modules/counter/cubit/cubit.dart';
import 'package:mainn/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state){
         if( state is CounterPlusState) {print('Plus State ${state.counter}');}
         if( state is CounterMinusState) {print('Minus State ${state.counter}');}
        },
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    CounterCubit.get(context).minus();
                  }, child: Text(
                    'Minus',
                  ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                   CounterCubit.get(context).plus();
                  }, child: Text(
                    'Plus',
                  ),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}