import 'package:bloc_prac/bloc/counter/counter_bloc.dart';
import 'package:bloc_prac/bloc/counter/counter_event.dart';
import 'package:bloc_prac/bloc/counter/counter_state.dart';
import 'package:bloc_prac/bloc/user/user_bloc.dart';
import 'package:bloc_prac/bloc/user/user_event.dart';
import 'package:bloc_prac/bloc/user/user_state.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserBloc>().add(GetAllUserList());
  }

  @override
  Widget build(BuildContext context) {
    final txtStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cubit Counter App"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserError) {
            return Center(
              child: Text(state.message.toString()),
            );
          } else if (state is UserDataLoaded) {
            return _view(context, state.userModelList);
          } else {
            return const Center();
          }
        },
      ),
    );
  }

  Widget _view(BuildContext context, List<UserModel>userModelList){

    return ListView.builder(
        itemCount: userModelList.length,
        itemBuilder: (context, index) {
          UserModel userModel = userModelList[index];
          return ListTile(
            leading: Text(userModel.id.toString()),
            title: Text(userModel.name.toString()),
            subtitle: Text(userModel.email.toString()),
            trailing: Text(userModel.company.toString()),
          );
        });

  }




//
//
// BlocBuilder<CounterBloc, CounterState>(
// builder: (context,state){
// if (state is CounterInit){
// return _view(context, 0);
// }  if  (state is CounterUpdate){
// return _view(context, state.counter);
// } else {
// return Container();
// }
// },
// ),
//
//
//
//
// Widget _view(BuildContext context, int value) {
//   return Column(
//     children: [
//       Text(
//         value.toString(),
//         style: TextStyle(fontSize: 20),
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               context.read<CounterBloc>().add(CounterIncrease());
//             },
//             child: Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               context.read<CounterBloc>().add(CounterDecrease());
//             },
//             child: Icon(Icons.minimize),
//           ),
//         ],
//       )
//     ],
//   );
// }
}
