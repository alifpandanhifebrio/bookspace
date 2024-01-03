import 'package:bookapp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PreferenceDoneView extends StatelessWidget {
  const PreferenceDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 32, left: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset('assets/image/happy_face.svg'),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Well Done!',
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Thank you for telling us your reading preferences! We’ll try our best to give you the most suitable book according to your preferences. ',
                  style: GoogleFonts.montserrat(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ButtonIcon(
                  label: 'View Recommendation',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const HomeView();
                        },
                      ),
                      (route) => true,
                    );
                  },
                  icon: const Icon(
                    Icons.launch_outlined,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
