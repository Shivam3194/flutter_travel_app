import 'package:flutter/material.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_state.dart';

class FavouriteScreen extends StatelessWidget {
  final FavouriteLoadedState state;
  const FavouriteScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Shivam's Favourite Screen with bloccccccccccccc"),
      ),
    );
  }
}
