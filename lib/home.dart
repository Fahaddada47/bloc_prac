import 'package:bloc_prac/cubit/counter%20_cubit_state.dart';
import 'package:bloc_prac/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final txtStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cubit Counter App"),
      ),
      body: BlocBuilder<CounterCubit, CounterCubitState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (state is CounterValueUpdated) ? Text(state.counter.toString(), style: txtStyle,) : Text("0",style: txtStyle),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: (){
                        context.read<CounterCubit>().counterIncrease();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: (){
                        context.read<CounterCubit>().counterDecrease();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.remove),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
