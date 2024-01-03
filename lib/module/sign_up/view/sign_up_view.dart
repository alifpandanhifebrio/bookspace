import 'package:bookapp/module/login/widget/Button_blue.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        alignment: Alignment.topCenter,
        child: SvgPicture.asset(
          'assets/image/sign_up.svg',
          width: MediaQuery.of(context).size.width,
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
            // height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, umm?',
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Let’s get to know each other, shall we?",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    hintText: 'First Name',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    hintText: 'Last Name',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    hintText: 'Gender',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calendar_month_outlined),
                    contentPadding: const EdgeInsets.all(20),
                    hintText: 'Date of Birth',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                    height: 53,
                    width: MediaQuery.of(context).size.width,
                    child: ButtonBlue(
                      label: 'Next',
                      icon: const Icon(Icons.abc),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp2View()));
                      },
                    )),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In Here!',
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}