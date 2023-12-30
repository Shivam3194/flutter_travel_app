import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/data/model/home_screen_model.dart';

abstract class FavouriteEvent extends Equatable {}

class FavouriteAddEvent extends FavouriteEvent {
  @override
  List<Object?> get props => [];
}

class FavouriteRemoveEvent extends FavouriteEvent {
  final PlacesListDetailed removedItemFromFavourite;

  FavouriteRemoveEvent({
    required this.removedItemFromFavourite,
  });
  @override
  List<Object?> get props => [removedItemFromFavourite];
}
