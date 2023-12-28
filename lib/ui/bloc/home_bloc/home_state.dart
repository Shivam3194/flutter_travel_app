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
  bool fillFavoriteIcon;

  HomeScreenLoadedState({
    required this.fieldData,
    this.fillFavoriteIcon = false,
  });

  HomeScreenLoadedState copyWith({
    HomeScreenModel? fieldData,
    bool? fillFavoriteIcon,
  }) {
    return HomeScreenLoadedState(
      fieldData: fieldData ?? this.fieldData,
      fillFavoriteIcon: fillFavoriteIcon ?? this.fillFavoriteIcon,
    );
  }

  @override
  List<Object?> get props => [fieldData, fillFavoriteIcon];
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
