import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent{}

class CounterIncrementPressed extends CounterEvent{}
class CounterDecrementPressed extends CounterEvent{}

class CounterBlocLogic extends Bloc<CounterEvent, int>{
  CounterBlocLogic(): super(0){
    on<CounterIncrementPressed>((event, emit){
      emit(state + 1);
      debugPrint("State: $state");
      debugPrint("Value: ${state + 1}");
    });
    on<CounterDecrementPressed>((event, emit){
      emit(state - 1);
      debugPrint("Value: ${state - 1}");
    });
  }
}