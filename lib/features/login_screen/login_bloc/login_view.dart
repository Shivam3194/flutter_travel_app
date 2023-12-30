import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/features/login_screen/views/signup_screen.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_view.dart';
import 'package:flutter_travel_app/ui/views/home_screen.dart';
import '../../../custom_files/app_colors.dart';
import '../views/login_screen.dart';
import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(LoginScreenAddEvent()),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginScreenInitialState ||
              state is LoginScreenLoadingState) {
            return const Scaffold(
              body: Center(
                child: SpinKitCircle(
                  color: AppColors.blue,
                  size: 40.0,
                ),
              ),
            );
          } else if (state is LoginScreenLoadedState) {
            return LoginScreen(
              onLoginPressed: (String mobileNumber, String password) {
                BlocProvider.of<LoginBloc>(context).add(LoginButtonPressedEvent(
                    mobileNumber: mobileNumber, password: password));
              },
              onSignUpPressed: () {
                BlocProvider.of<LoginBloc>(context).add(SignUpScreenAddEvent());
              },
            );
          } else if (state is SignUpScreenLoadedState) {
            return SignUpScreen();
          } else if (state is MoveToHomeScreenState) {
            return const HomeScreen();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
