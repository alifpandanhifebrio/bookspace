import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  final Color? color;
  final Icon? icon;

  const ButtonIcon(
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
      child: ElevatedButton.icon(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            foregroundColor: const MaterialStatePropertyAll(Colors.white),
            backgroundColor: const MaterialStatePropertyAll(Color(0xff1F73D6))),
        onPressed: () => onPressed(),
        icon: const Icon(
          Icons.launch_outlined,
          size: 16,
        ),
        label: Text(label),
      ),
    );
  }
}
