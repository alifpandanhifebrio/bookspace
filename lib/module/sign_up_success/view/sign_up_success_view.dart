import 'package:bookapp/core.dart';
import 'package:bookapp/module/sign_up_success/widget/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpSuccessView extends StatelessWidget {
  const SignUpSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 42, left: 42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/image/rocket.svg'),
          const SizedBox(
            height: 32.0,
          ),
          Text(
            "You're All Set!",
            style: GoogleFonts.montserrat(
                fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "Please continue singing in using your account.",
            style: GoogleFonts.montserrat(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 16.0,
          ),
          ButtonIcon(
            label: 'Sign In',
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
            icon: const Icon(
              Icons.launch_outlined,
              size: 16,
            ),
          )
        ],
      ),
    ));
  }
}