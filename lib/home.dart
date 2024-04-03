import 'package:bloc_prac/bloc/counter_bloc.dart';
import 'package:bloc_prac/bloc/counter_event.dart';
import 'package:bloc_prac/bloc/counter_state.dart';
import 'package:bloc_prac/cubit/user_cubit.dart';
import 'package:bloc_prac/cubit/user_cubit_state.dart';
import 'package:bloc_prac/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    final txtStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cubit Counter App"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context,state){
          if (state is CounterInit){
            return _view(context, 0);
          }  if  (state is CounterUpdate){
            return _view(context, state.counter);
          } else {
            return Container();
          }
        },
      ),
      // body: BlocBuilder<UserCubit, UserCubitState>(
      //   builder: (context, state) {
      //     if (state is UserCubitLoading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (state is UserCubitError) {
      //       return Center(
      //         child: Text(state.message.toString()),
      //       );
      //     } else if (state is UserCubitDataLoaded) {
      //       return ListView.builder(
      //           itemCount: state.userList.length,
      //           itemBuilder: (context, index) {
      //             UserModel userModel = state.userList[index];
      //             return ListTile(
      //               leading: Text(userModel.id.toString()),
      //               title: Text(userModel.name.toString()),
      //               subtitle: Text(userModel.email.toString()),
      //               trailing: Text(userModel.company.toString()),
      //             );
      //           });
      //     } else {
      //       return const Center();
      //     }
      //   },
      // ),
    );
  }

  Widget _view(BuildContext context, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrease());
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrease());
              },
              child: Icon(Icons.minimize),
            ),
          ],
        )
      ],
    );
  }
}
