import 'package:equatable/equatable.dart';

abstract class ClockState extends Equatable {}

class ClockInitialState extends ClockState {
  @override
  List<Object?> get props => [];
}

class ClockLoadingState extends ClockState {
  @override
  List<Object?> get props => [];
}

class ClockLoadedState extends ClockState {
  @override
  List<Object?> get props => [];
}

class ClockErrorState extends ClockState {
  @override
  List<Object?> get props => [];
}

class ClockEmptyState extends ClockState {
  @override
  List<Object?> get props => [];
}
