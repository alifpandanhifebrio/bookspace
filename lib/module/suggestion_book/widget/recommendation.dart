import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget recommendation(
    {required String label,
    required String value,
    required BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 150,
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.1),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          8.0,
        ),
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Image.asset(
            value,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Positioned(
            left: 40,
            top: 100,
            child: Text(
              label,
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
