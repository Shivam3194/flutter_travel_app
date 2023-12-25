import 'package:bloc/bloc.dart';
import 'package:flutter_travel_app/ui/bloc/person_bloc/person_event.dart';
import 'package:flutter_travel_app/ui/bloc/person_bloc/person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonInitialState()) {
    on<PersonAddEvent>((event, emit) async {
      try {
        emit(PersonLoadingState());
        await Future.delayed(const Duration(seconds: 2));
        emit(PersonLoadedState());
      } catch (e) {
        emit(PersonErrorState());
      }
    });
  }
}
