import 'package:bloc/bloc.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_state.dart';

import 'favourite_event.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitialState()) {
    on<FavouriteAddEvent>((event, emit) async {
      try {
        emit(FavouriteLoadingState());
        await Future.delayed(const Duration(seconds: 2));
        emit(FavouriteLoadedState());
      } catch (e) {
        emit(FavouriteErrorState());
      }
    });
  }
}
