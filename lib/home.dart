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
    context.read<UserCubit>().getAllUserList();
  }

  @override
  Widget build(BuildContext context) {
    final txtStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cubit Counter App"),
      ),
      body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state) {
          if (state is UserCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserCubitError) {
            return Center(
              child: Text(state.message.toString()),
            );
          } else if (state is UserCubitDataLoaded) {
            return ListView.builder(
                itemCount: state.userList.length,
                itemBuilder: (context, index) {
                  UserModel userModel = state.userList[index];
                  return ListTile(
                    leading: Text(userModel.id.toString()),
                    title: Text(userModel.name.toString()),
                    subtitle: Text(userModel.email.toString()),
                    trailing: Text(userModel.company.toString()),
                  );
                });
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
//Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(userModel.id.toString()),
//                         SizedBox(width: 10,),
//                         Text(userModel.name.toString()),
//                       ],
//                     ),
//
//
//                   ],
//                 )
