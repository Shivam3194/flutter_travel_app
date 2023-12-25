import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/ui/bloc/clock_bloc/clock_event.dart';

import '../../../custom_files/app_colors.dart';
import '../../views/bottom_icon/clock_screen.dart';
import 'clock_bloc.dart';
import 'clock_state.dart';

class ClockView extends StatelessWidget {
  final VoidCallback onSelected;
  const ClockView({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return BlocProvider(
      create: (context) => ClockBloc()..add(ClockAddEvent()),
      child: BlocBuilder<ClockBloc, ClockState>(
        builder: (context, state) {
          if (state is ClockInitialState || state is ClockLoadingState) {
            return const Scaffold(
              body: Center(
                child: SpinKitCircle(
                  color: AppColors.blue,
                  size: 40.0,
                ),
              ),
            );
          }
          if (state is ClockLoadedState) {
            return ClockScreen(state: state);
          } else if (state is ClockEmptyState) {
            return const Center(child: Text("No Data Found"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
