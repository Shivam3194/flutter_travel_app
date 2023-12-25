import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_files/app_colors.dart';

class TouristPlaceDetailed extends StatelessWidget {
  String? capitalName;
  String? placeName;
  String? countryName;
  String? rating;
  String? image;
  String? price;
  String? temperature;
  String? travelTime;
  String? description;
  TouristPlaceDetailed({
    super.key,
    this.capitalName = '',
    this.placeName = '',
    this.countryName = '',
    this.rating = '',
    this.image = '',
    this.price = '',
    this.temperature = '',
    this.travelTime = '',
    this.description = '',
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: height * 0.45,
                          width: width * 0.99,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              image ?? "",
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
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
                            elevation: 7,
                            color: Color(0xFF6E409B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 5, left: 10, right: 10),
                              width: height * .40,
                              height: width * .22,
                              child: Column(
                                children: [
                                  Container(
                                    width: width * .7,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          //"Mount Fuji, Tokyo",
                                          placeName ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                        ),
                                        Text(
                                          //"🌍 Tokyo, Japan",
                                          "Price",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: width * 0.7,
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
                                              "$capitalName, $countryName",
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
                                        Text(
                                          //"* 4.8",
                                          "\$ ${price ?? ""}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Colors.white.withOpacity(0.8),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 25,
                          child: Chip(
                            padding: const EdgeInsets.fromLTRB(-2, -2, -2, -2),
                            label: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(Icons.arrow_back_ios_sharp),
                            ),
                            shape: const CircleBorder(),
                            backgroundColor: Colors.grey.withOpacity(0.9),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 25,
                          child: Chip(
                            padding: const EdgeInsets.fromLTRB(-2, -2, -2, -2),
                            label: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.bookmark_border_rounded),
                            ),
                            shape: const CircleBorder(),
                            backgroundColor: Colors.grey.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Overview",
                          style: GoogleFonts.poppins(
                            letterSpacing: 0.3,
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Text(
                          "Details",
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
                    padding: const EdgeInsets.only(top: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Chip(
                              padding:
                                  const EdgeInsets.fromLTRB(-2, -2, -2, -2),
                              label: const Icon(Icons.access_time_filled),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(8),
                              ),
                            ),
                            Text(
                              "$travelTime hours",
                              style: GoogleFonts.poppins(
                                letterSpacing: 0.3,
                                color: Colors.pink.withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Chip(
                              padding:
                                  const EdgeInsets.fromLTRB(-2, -2, -2, -2),
                              label: const Icon(Icons.wb_cloudy),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(8),
                              ),
                            ),
                            Text(
                              "$temperature °C",
                              style: GoogleFonts.poppins(
                                letterSpacing: 0.3,
                                color: Colors.pink.withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Chip(
                              padding:
                                  const EdgeInsets.fromLTRB(-2, -2, -2, -2),
                              label: const Icon(Icons.star),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(8),
                              ),
                            ),
                            Text(
                              rating ?? "",
                              style: GoogleFonts.poppins(
                                letterSpacing: 0.3,
                                color: Colors.pink.withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: Text(
                      description ?? "",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.1,
                        color: Colors.pink.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Button border radius
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Book Now",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 14),
                  Icon(
                    Icons.rocket_launch_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
