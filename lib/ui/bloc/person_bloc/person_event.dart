import 'package:equatable/equatable.dart';

abstract class PersonEvent extends Equatable {}

class PersonAddEvent extends PersonEvent {
  @override
  List<Object?> get props => [];
}
