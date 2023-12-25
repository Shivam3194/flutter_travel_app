import 'package:equatable/equatable.dart';

import '../../../data/model/home_screen_model.dart';

abstract class HomeState extends Equatable {}

class HomeScreenInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeScreenLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeScreenLoadedState extends HomeState {
  final HomeScreenModel? fieldData;

  HomeScreenLoadedState({
    required this.fieldData,
  });
  @override
  List<Object?> get props => [];
}

class HomeScreenErrorState extends HomeState {
  final String message;

  HomeScreenErrorState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class HomeScreenEmptyState extends HomeState {
  @override
  List<Object?> get props => [];
}
