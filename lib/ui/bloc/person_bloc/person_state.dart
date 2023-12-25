import 'package:equatable/equatable.dart';

abstract class PersonState extends Equatable {}

class PersonInitialState extends PersonState {
  @override
  List<Object?> get props => [];
}

class PersonLoadingState extends PersonState {
  @override
  List<Object?> get props => [];
}

class PersonLoadedState extends PersonState {
  @override
  List<Object?> get props => [];
}

class PersonErrorState extends PersonState {
  @override
  List<Object?> get props => [];
}

class PersonEmptyState extends PersonState {
  @override
  List<Object?> get props => [];
}
