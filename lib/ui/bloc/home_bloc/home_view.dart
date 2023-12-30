import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/custom_files/app_colors.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_event.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_state.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/model/home_screen_model.dart';
import '../../views/bottom_icon/home_icon_screen.dart';

class HomeView extends StatelessWidget {
  final VoidCallback onSelected;
  HomeView({
    super.key,
    required this.onSelected,
  });

  TextEditingController textEditingController = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeScreenAddEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeScreenInitialState ||
              state is HomeScreenLoadingState) {
            return const Scaffold(
              body: Center(
                child: SpinKitCircle(
                  color: AppColors.blue,
                  size: 40.0,
                ),
              ),
            );
          }
          if (state is HomeScreenLoadedState) {
            return HomeIconScreen(
              state: state,
              onFavouritePressed: (PlacesListDetailed placesListDetailed) {
                BlocProvider.of<HomeBloc>(context).add(
                    HomeTouristPlaceWidgetFavouriteIconClickedEvent(
                        clickedTouristPlace: placesListDetailed));
              },
            );
          } else if (state is HomeScreenEmptyState) {
            return const Center(child: Text("No Data Found"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
