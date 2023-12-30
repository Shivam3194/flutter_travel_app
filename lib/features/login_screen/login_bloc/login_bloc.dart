import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginScreenInitialState()) {
    on<LoginScreenAddEvent>((event, emit) async {
      try {
        emit(LoginScreenLoadingState());

        emit(LoginScreenLoadedState());
      } catch (e) {
        emit(LoginScreenErrorState(
          message: 'Unknown Exception',
        ));
      }
    });

    on<LoginButtonPressedEvent>((event, emit) async {
      try {
        emit(LoginScreenLoadingState());

        emit(MoveToHomeScreenState());
      } catch (e) {
        emit(LoginScreenErrorState(
          message: 'Unknown Exception',
        ));
      }
    });

    on<SignUpScreenAddEvent>((event, emit) async {
      try {
        emit(LoginScreenLoadingState());

        emit(SignUpScreenLoadedState());
      } catch (e) {
        emit(LoginScreenErrorState(
          message: 'Unknown Exception',
        ));
      }
    });
  }
}
