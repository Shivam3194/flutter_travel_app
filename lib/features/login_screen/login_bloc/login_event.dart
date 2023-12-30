import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginScreenAddEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  String? mobileNumber;
  String? password;

  LoginButtonPressedEvent({
    required this.mobileNumber,
    required this.password,
  });
  @override
  List<Object?> get props => [mobileNumber, password];
}

class SignUpScreenAddEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
