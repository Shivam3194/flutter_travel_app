import 'package:bloc/bloc.dart';
import 'package:flutter_travel_app/data/repo/travel_repo.dart';
import 'package:flutter_travel_app/data/repo/travel_repo_impl.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_event.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_state.dart';

import '../../../data/model/home_screen_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  TravelRepo travelRepo = TravelRepoImpl();
  HomeBloc() : super(HomeScreenInitialState()) {
    on<HomeScreenAddEvent>((event, emit) async {
      try {
        emit(HomeScreenLoadingState());

        HomeScreenModel? record = await travelRepo.getHomeScreenModelData();

        emit(HomeScreenLoadedState(fieldData: record));
      } catch (e) {
        emit(HomeScreenErrorState(
          message: 'Unknown Exception',
        ));
      }
    });
  }
}
