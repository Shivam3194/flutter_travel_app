import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_state.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_files/app_colors.dart';
import '../../../data/model/home_screen_model.dart';
import '../widgets/tourist_place_widget.dart';

class HomeIconScreen extends StatelessWidget {
  HomeIconScreen({
    super.key,
    required this.state,
    this.placesListDetailed,
    required this.onFavouritePressed,
  });

  final HomeScreenLoadedState state;
  final PlacesListDetailed? placesListDetailed;
  TextEditingController textEditingController = TextEditingController();
  final Function(PlacesListDetailed)? onFavouritePressed;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final item = state.fieldData!;
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Hi, ${item.profileInfo!.name ?? ""} 👋\n",
                          style: GoogleFonts.poppins(
                            letterSpacing: 0.3,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Explore the world",
                          style: GoogleFonts.poppins(
                            letterSpacing: 0.3,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.pink.withOpacity(0.1),
                    backgroundImage: item.profileInfo!.imageUrl!.isNotEmpty
                        ? NetworkImage(item.profileInfo!.imageUrl!)
                        : const NetworkImage(''),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search places',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    suffixIcon: const Icon(
                      Icons.filter,
                    ),
                  ),
                  controller: textEditingController,
                  focusNode: focusNode,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 4, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular places",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.3,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.3,
                        color: Colors.pink.withOpacity(0.6),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Chip(
                      label: Text("Most Viewed"),
                    ),
                    Chip(
                      label: Text("Nearby"),
                    ),
                    Chip(
                      label: Text("Latest"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  height: 320,
                  child: ListView.builder(
                    itemCount: item.placesListDetailed!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item1 = item.placesListDetailed![index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: TouristPlaceWidget(
                          placesListDetailed: item1,
                          onFavouritePressed: onFavouritePressed,
                          fillfavoriteIcon: state.fillFavoriteIcon,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
