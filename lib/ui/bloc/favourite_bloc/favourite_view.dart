import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/data/model/home_screen_model.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_event.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_state.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_files/app_colors.dart';
import '../../views/bottom_icon/favourite_screen.dart';

class FavouriteView extends StatelessWidget {
  final VoidCallback onSelected;
  const FavouriteView({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return BlocProvider(
      create: (context) => FavouriteBloc()..add(FavouriteAddEvent()),
      child: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteInitialState ||
              state is FavouriteLoadingState) {
            return const Scaffold(
              body: Center(
                child: SpinKitCircle(
                  color: AppColors.blue,
                  size: 40.0,
                ),
              ),
            );
          }
          if (state is FavouriteLoadedState) {
            return FavouriteScreen(
              state: state,
              onFavouriteRemoved: (PlacesListDetailed placesListDetailed) {
                BlocProvider.of<FavouriteBloc>(context).add(
                    FavouriteRemoveEvent(
                        removedItemFromFavourite: placesListDetailed));
              },
            );
          } else if (state is FavouriteEmptyState) {
            return const Center(child: Text("No Data Found"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
