import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController userEmailEditingController = TextEditingController();
  TextEditingController userMobileEditingController = TextEditingController();
  TextEditingController userPasswordEditingController = TextEditingController();

  FocusNode userNamefocusNode = FocusNode();
  FocusNode userEmailfocusNode = FocusNode();
  FocusNode userMobilefocusNode = FocusNode();
  FocusNode userpasswordfocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        centerTitle: true,
        title: Text(
          'SIGNUP SCREEN',
          style: GoogleFonts.poppins(
            letterSpacing: 0.9,
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/LoginScreen');
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?q=80&w=1886&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
            Positioned(
              top: height / 7,
              bottom: 20,
              child: SizedBox(
                height: height,
                width: width,
                child: Card(
                  elevation: 3,
                  color: Colors.white.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 16, left: 8, right: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Full Name',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              suffixIcon: const Icon(
                                Icons.person,
                              ),
                            ),
                            controller: userNameEditingController,
                            focusNode: userNamefocusNode,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 32, left: 8, right: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Email Address',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              suffixIcon: const Icon(
                                Icons.email,
                              ),
                            ),
                            controller: userEmailEditingController,
                            focusNode: userEmailfocusNode,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 32, left: 8, right: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              suffixIcon: const Icon(
                                Icons.mobile_friendly_sharp,
                              ),
                            ),
                            controller: userMobileEditingController,
                            focusNode: userNamefocusNode,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 32, left: 8, right: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              suffixIcon: const Icon(
                                Icons.password_sharp,
                              ),
                            ),
                            controller: userPasswordEditingController,
                            focusNode: userpasswordfocusNode,
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 74, 24, 24),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12.0), // Button border radius
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      letterSpacing: 0.4,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 14),
                                  Icon(
                                    Icons.build,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
