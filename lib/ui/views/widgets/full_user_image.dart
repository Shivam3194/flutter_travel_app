import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/ui/views/home_screen.dart';
import 'package:flutter_travel_app/ui/views/widgets/google_map_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class FullUserImage extends StatelessWidget {
  final String imageurl;
  final String userName;

  const FullUserImage({
    super.key,
    this.imageurl = '',
    this.userName = '',
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        title: Text(
          userName,
          style: GoogleFonts.poppins(
            letterSpacing: 0.3,
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.maps_ugc_rounded),
          )
        ],
      ),
      body: Center(
        child: Container(
          height: 350,
          width: width,
          child: CachedNetworkImage(
            imageUrl: imageurl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              child: const Center(
                child: SpinKitCircle(
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
