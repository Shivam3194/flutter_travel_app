import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/ui/views/tourist_place_detailed.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_files/app_colors.dart';
import '../../../data/model/home_screen_model.dart';

class TouristPlaceWidget extends StatefulWidget {
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
  State<TouristPlaceWidget> createState() => _TouristPlaceWidgetState();
}

class _TouristPlaceWidgetState extends State<TouristPlaceWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return InkWell(
      onTap: () {
        String capitalName = widget.placesListDetailed!.capitalName ?? " ";
        String placeName = widget.placesListDetailed!.placeName ?? "";
        String countryName = widget.placesListDetailed!.countryName ?? "";
        String rating = widget.placesListDetailed!.rating ?? "";
        String image = widget.placesListDetailed!.url ?? " ";
        String price = widget.placesListDetailed!.price ?? "";
        String temperature = widget.placesListDetailed!.temperature ?? "";
        String travelTime = widget.placesListDetailed!.travelTime ?? "";
        String description = widget.placesListDetailed!.description ?? "";
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
                  widget.placesListDetailed!.url ?? " ",
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
                          widget.placesListDetailed!.placeName ?? "",
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
                                    "${widget.placesListDetailed!.capitalName}, ${widget.placesListDetailed!.countryName}",
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
                                    widget.placesListDetailed!.rating ?? " ",
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
              child: InkWell(
                onTap: () {
                  widget.onFavouritePressed!.call(widget.placesListDetailed!);
                  if (widget.fillfavoriteIcon) {
                    setState(() {
                      widget.placesListDetailed!.isFavorite =
                          !(widget.placesListDetailed!.isFavorite);
                    });
                  }
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.withOpacity(0.9),
                  child: widget.placesListDetailed!.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 35,
                        )
                      : const Icon(
                          Icons.favorite_border_outlined,
                          size: 35,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
