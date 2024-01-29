import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/ui/bloc/person_bloc/person_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom_files/app_colors.dart';
import '../widgets/full_user_image.dart';

class PersonScreen extends StatelessWidget {
  final PersonLoadedState state;
  const PersonScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: AppColors.primaryColor.withOpacity(0.4),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  _showCircularImageDialog(
                    context,
                    "https://images.unsplash.com/photo-1703368068320-188aafd42ed3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MXx8fGVufDB8fHx8fA%3D%3D",
                    "Shivam Gupta",
                  );
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.pink.withOpacity(0.1),
                  backgroundImage: const NetworkImage(
                      "https://images.unsplash.com/photo-1703368068320-188aafd42ed3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MXx8fGVufDB8fHx8fA%3D%3D"),
                  // backgroundImage: item.profileInfo!.imageUrl!.isNotEmpty
                  //     ? NetworkImage(item.profileInfo!.imageUrl!)
                  //     : const NetworkImage(''),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Shivam Gupta",
                    style: GoogleFonts.poppins(
                      letterSpacing: 0.3,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View & Edit Profile",
                    style: GoogleFonts.poppins(
                      letterSpacing: 0.3,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void _showCircularImageDialog(
    BuildContext context, String imageUrl, String userName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullUserImage(
                  imageurl: imageUrl,
                  userName: userName,
                ),
              )).then((_) => {
                Navigator.of(context).pop(),
              });
        },
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 500,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
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
    },
  );
}
