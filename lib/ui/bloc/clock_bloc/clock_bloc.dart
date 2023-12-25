import 'package:bloc/bloc.dart';

import 'clock_event.dart';
import 'clock_state.dart';

class ClockBloc extends Bloc<ClockEvent, ClockState> {
  ClockBloc() : super(ClockInitialState()) {
    on<ClockAddEvent>((event, emit) async {
      try {
        emit(ClockLoadingState());
        await Future.delayed(const Duration(seconds: 2));
        emit(ClockLoadedState());
      } catch (e) {
        emit(ClockErrorState());
      }
    });
  }
}
