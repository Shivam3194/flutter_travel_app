import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/ui/bloc/person_bloc/person_event.dart';
import 'package:flutter_travel_app/ui/bloc/person_bloc/person_state.dart';
import 'package:flutter_travel_app/ui/views/bottom_icon/person_screen.dart';

import '../../../custom_files/app_colors.dart';
import 'person_bloc.dart';

class PersonView extends StatelessWidget {
  final VoidCallback onSelected;
  const PersonView({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return BlocProvider(
      create: (context) => PersonBloc()..add(PersonAddEvent()),
      child: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) {
          if (state is PersonInitialState || state is PersonLoadingState) {
            return const Scaffold(
              body: Center(
                child: SpinKitCircle(
                  color: AppColors.blue,
                  size: 40.0,
                ),
              ),
            );
          }
          if (state is PersonLoadedState) {
            return PersonScreen(state: state);
          } else if (state is PersonEmptyState) {
            return const Center(child: Text("No Data Found"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
