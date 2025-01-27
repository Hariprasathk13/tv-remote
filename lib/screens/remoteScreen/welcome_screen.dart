import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remote/screens/remoteScreen/Locate_tv.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LocateTv()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0E1F), Color(0xFF1C2B3B)], // Darker gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Custom Icon Area with harmonious gradient
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFF1D3C58), // A dark blue with a subtle teal tone
                      Color(0xFF4E8D99) // Lighter teal with a silver touch
                    ],
                    stops: [
                      0.3,
                      1.0
                    ], // Adjusting the spread of the colors for a smoother blend
                    center: Alignment.center,
                    radius: 0.8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 25,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.tv_rounded,
                  size: 90,
                  color:
                      Colors.white, // White icon color for contrast and clarity
                ),
              ),
              const SizedBox(height: 40),

              // App Title with Majestic Font
              Text(
                "SMARTWAVE",
                style: GoogleFonts.aboreto(
                  fontSize: 50, // Larger font for prominence
                  letterSpacing: 3,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      // color: Colors.blueAccent.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "TELEVISION CONTROL",
                style: GoogleFonts.abrilFatface(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Slogan with elegant typography
              Text(
                "Stream, Control, Enjoy",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white60,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 60),

              // Developer Credit with subtle shadow for elegance
              Text(
                "Developed by DEESHIKA",
                style: GoogleFonts.alatsi(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white38,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
