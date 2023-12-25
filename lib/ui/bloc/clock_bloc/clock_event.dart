import 'package:equatable/equatable.dart';

abstract class ClockEvent extends Equatable {}

class ClockAddEvent extends ClockEvent {
  @override
  List<Object?> get props => [];
}
