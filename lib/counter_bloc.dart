import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CouterIncrement>((event, emit) {
      // TODO: implement event handler
      emit(state + 1);
    });
  }
}
