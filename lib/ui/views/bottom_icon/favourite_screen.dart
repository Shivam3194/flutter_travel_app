import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_state.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_files/app_colors.dart';
import '../tourist_place_detailed.dart';

class FavouriteScreen extends StatelessWidget {
  final FavouriteLoadedState state;

  const FavouriteScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Favourites",
              style: GoogleFonts.poppins(
                letterSpacing: 0.3,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: ListView.builder(
            itemCount: state.favouriteModel.length,
            itemBuilder: (context, index) {
              final item = state.favouriteModel[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TouristPlaceDetailed(
                                capitalName: item.capitalName,
                                placeName: item.placeName,
                                countryName: item.countryName,
                                rating: item.rating,
                                image: item.url,
                                price: item.price,
                                temperature: item.temperature,
                                travelTime: item.travelTime,
                                description: item.description,
                              ),
                            ));
                      },
                      child: SizedBox(
                        height: height * 0.25,
                        width: width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            item.url ?? "",
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                  child: SpinKitCircle(
                                    color: AppColors.blue,
                                    size: 50,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: Card(
                        elevation: 5,
                        color: Color(0xFF6E409B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 3, left: 10, right: 10),
                          width: height * .30,
                          height: width * .16,
                          child: Column(
                            children: [
                              Container(
                                width: width * .7,
                                child: Text(
                                  item.placeName ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                width: width * 0.7,
                                child: Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.add_location_alt_outlined,
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            size: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            //"🌍 Tokyo, Japan",
                                            "${item.capitalName}, ${item.countryName}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.pink,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_border,
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            size: 18,
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            //"* 4.8",
                                            item.rating ?? " ",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.pink,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
