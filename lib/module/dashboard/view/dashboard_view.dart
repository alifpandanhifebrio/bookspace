import 'package:bookapp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: const Color(0xffabd1ff),
        alignment: Alignment.center,
        // width: MediaQuery.of(context).size.width,
        // height: double.infinity,
        child: SvgPicture.asset(
          'assets/image/smiley.svg',
          fit: BoxFit.contain,
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: FittedBox(
          child: Container(
            padding: const EdgeInsets.all(32),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, There!',
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'To help us provide you with the best book recommendations, would you mind to take a little detour and tell us your reading preferences?',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ButtonBlue(
                  label: "Sure!, Let's take a detour",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const SuggestionBookView();
                        },
                      ),
                      (route) => true,
                    );
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}