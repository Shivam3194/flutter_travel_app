import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/ui/views/tourist_place_detailed.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_files/app_colors.dart';
import '../../../data/model/home_screen_model.dart';

class TouristPlaceWidget extends StatelessWidget {
  final PlacesListDetailed? placesListDetailed;
  final Function(PlacesListDetailed)? onFavouritePressed;
  bool fillfavoriteIcon;
  TouristPlaceWidget({
    super.key,
    required this.placesListDetailed,
    required this.onFavouritePressed,
    this.fillfavoriteIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return InkWell(
      onTap: () {
        String capitalName = placesListDetailed!.capitalName ?? " ";
        String placeName = placesListDetailed!.placeName ?? "";
        String countryName = placesListDetailed!.countryName ?? "";
        String rating = placesListDetailed!.rating ?? "";
        String image = placesListDetailed!.url ?? " ";
        String price = placesListDetailed!.price ?? "";
        String temperature = placesListDetailed!.temperature ?? "";
        String travelTime = placesListDetailed!.travelTime ?? "";
        String description = placesListDetailed!.description ?? "";
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TouristPlaceDetailed(
                capitalName: capitalName,
                placeName: placeName,
                countryName: countryName,
                rating: rating,
                image: image,
                price: price,
                temperature: temperature,
                travelTime: travelTime,
                description: description,
              ),
            ));
      },
      child: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: height * 0.42,
              width: width * 0.7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  placesListDetailed!.url ?? " ",
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
                          //"Mount Fuji, Tokyo",
                          placesListDetailed!.placeName ?? "",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.add_location_alt_outlined,
                                    color: Colors.white.withOpacity(0.9),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    //"🌍 Tokyo, Japan",
                                    "${placesListDetailed!.capitalName}, ${placesListDetailed!.countryName}",
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
                                    color: Colors.white.withOpacity(0.9),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    //"* 4.8",
                                    placesListDetailed!.rating ?? " ",
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
            Positioned(
              top: 15,
              right: 15,
              child: Chip(
                padding: const EdgeInsets.fromLTRB(-2, -2, -2, -2),
                label: InkWell(
                  onTap: () {
                    onFavouritePressed != null
                        ? onFavouritePressed!.call(placesListDetailed!)
                        : null;
                  },
                  child: placesListDetailed!.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border_outlined,
                        ),
                ),
                shape: const CircleBorder(),
                backgroundColor: Colors.grey.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
