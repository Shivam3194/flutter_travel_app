import 'package:bloc/bloc.dart';
import 'package:flutter_travel_app/data/model/favourite_model.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_state.dart';

import '../../../data/repo/travel_repo.dart';
import '../../../data/repo/travel_repo_impl.dart';
import 'favourite_event.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  TravelRepo travelRepo = TravelRepoImpl();
  FavouriteBloc() : super(FavouriteInitialState()) {
    on<FavouriteAddEvent>((event, emit) async {
      try {
        emit(FavouriteLoadingState());

        List<FavouriteModel>? record = travelRepo.getFavouriteModelData();

        emit(FavouriteLoadedState(favouriteModel: record));
      } catch (e) {
        emit(FavouriteErrorState(
          message: 'Unknown Exception',
        ));
      }
    });
  }
}
