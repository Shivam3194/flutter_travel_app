import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginScreenInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginScreenLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginScreenLoadedState extends LoginState {
  @override
  List<Object?> get props => [];
}

class SignUpScreenLoadedState extends LoginState {
  @override
  List<Object?> get props => [];
}

class MoveToHomeScreenState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginScreenErrorState extends LoginState {
  final String message;

  LoginScreenErrorState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
