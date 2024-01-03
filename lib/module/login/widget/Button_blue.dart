import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonBlue extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  final Color? color;
  final Icon? icon;

  const ButtonBlue(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.width,
      this.color,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widgetWidth = width ?? MediaQuery.of(context).size.width;
    double widgetHeight = 53.0;

    return SizedBox(
      width: widgetWidth,
      height: widgetHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 0,
            backgroundColor: const Color(0xff1F73D6),
            foregroundColor: Colors.white),
        onPressed: () => onPressed(),
        child: Text(
          label,
          style:
              GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
