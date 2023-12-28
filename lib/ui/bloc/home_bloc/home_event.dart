import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/data/model/home_screen_model.dart';

abstract class HomeEvent extends Equatable {}

class HomeScreenAddEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeTouristPlaceWidgetFavouriteIconClickedEvent extends HomeEvent {
  final PlacesListDetailed placesListDetailed;

  HomeTouristPlaceWidgetFavouriteIconClickedEvent({
    required this.placesListDetailed,
  });
  @override
  List<Object?> get props => [placesListDetailed];
}
