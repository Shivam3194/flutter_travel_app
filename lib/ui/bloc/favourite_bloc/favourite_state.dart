import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/data/model/favourite_model.dart';
import 'package:flutter_travel_app/data/model/home_screen_model.dart';

abstract class FavouriteState extends Equatable {}

class FavouriteInitialState extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class FavouriteLoadingState extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class FavouriteLoadedState extends FavouriteState {
  final List<PlacesListDetailed> favouriteItems;
  bool? isitemRemovedFromFavourite;

  FavouriteLoadedState({
    required this.favouriteItems,
    this.isitemRemovedFromFavourite = false,
  });
  @override
  List<Object?> get props => [favouriteItems, isitemRemovedFromFavourite];
}

class FavouriteErrorState extends FavouriteState {
  final String message;

  FavouriteErrorState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class FavouriteEmptyState extends FavouriteState {
  @override
  List<Object?> get props => [];
}
