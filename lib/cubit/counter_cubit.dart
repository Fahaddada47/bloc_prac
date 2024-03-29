import 'package:bloc_prac/cubit/counter%20_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterInitiate());
  int counter = 0;

  void counterIncrease() {
    counter++;
    emit(CounterValueUpdated(counter: counter));
  }

  void counterDecrease() {
    if (counter > 0) {
      counter--;
      emit(CounterValueUpdated(counter: counter));
    }
  }
}
