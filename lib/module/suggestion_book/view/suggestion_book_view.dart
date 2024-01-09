import 'package:bookapp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionBookView extends StatelessWidget {
  const SuggestionBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 60, right: 32, left: 32),
              child: Column(
                children: [
                  recommendation(
                      label: 'Phylosophy',
                      value: 'assets/image/philosophy.jpg',
                      context: context),
                  const SizedBox(
                    height: 40.0,
                  ),
                  recommendation(
                      label: 'Agriculture',
                      value: 'assets/image/agriculture.jpg',
                      context: context),
                  const SizedBox(
                    height: 40.0,
                  ),
                  recommendation(
                      label: 'Sci-Fi',
                      value: 'assets/image/sci-fi.jpg',
                      context: context),
                  const SizedBox(
                    height: 40.0,
                  ),
                  recommendation(
                      label: 'Comic',
                      value: 'assets/image/comic.jpg',
                      context: context),
                  const SizedBox(
                    height: 40.0,
                  ),
                  recommendation(
                      label: 'Comic',
                      value: 'assets/image/comic.jpg',
                      context: context),
                  const SizedBox(
                    height: 40.0,
                  ),
                  recommendation(
                      label: 'Comic',
                      value: 'assets/image/comic.jpg',
                      context: context),
                ],
              ),
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
                      'What types of books would you like to read?',
                      style: GoogleFonts.montserrat(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Choose up to 5 book types for starter — the more you add, the better the recommendation will be!",
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xff1F73D6),
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: IconButton(
                              style: const ButtonStyle(),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(
                                  'assets/icons/arrow_left.svg')),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 53,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 0,
                                  backgroundColor: const Color(0xff1F73D6),
                                  foregroundColor: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PreferenceDoneView(),
                                  ),
                                );
                              },
                              child: Text(
                                'Next',
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
