import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/login_and_sign_model.dart';
import '../login_bloc/login_bloc.dart';
import '../login_bloc/login_event.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
    this.onLoginPressed,
    this.onSignUpPressed,
  });

  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  FocusNode mobilefocusNode = FocusNode();
  FocusNode passwordfocusNode = FocusNode();
  final Function(String, String)? onLoginPressed;
  final VoidCallback? onSignUpPressed;
  String? mobileNumber;
  String? password;

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
          'LOGIN SCREEN',
          style: GoogleFonts.poppins(
            letterSpacing: 0.9,
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
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1559056961-1f4dbbf9d36a?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
              top: height / 4,
              child: SizedBox(
                height: height,
                width: width,
                child: Card(
                  elevation: 3,
                  color: Colors.white.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
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
                              hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              suffixIcon: const Icon(
                                Icons.phone,
                              ),
                            ),
                            controller: mobileEditingController,
                            focusNode: mobilefocusNode,
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
                                Icons.password,
                              ),
                            ),
                            controller: passwordEditingController,
                            focusNode: passwordfocusNode,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 32, left: 10, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Don't Have an Account ?",
                                style: GoogleFonts.poppins(
                                  letterSpacing: 0.3,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  onSignUpPressed!.call();
                                },
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.poppins(
                                    letterSpacing: 0.3,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
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
                              onPressed: () {
                                onLoginPressed!(
                                    mobileNumber ?? "", password ?? "");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      letterSpacing: 0.4,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 14),
                                  Icon(
                                    Icons.login,
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
