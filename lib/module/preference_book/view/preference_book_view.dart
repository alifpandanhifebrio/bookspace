// import 'package:bookspace/module/preference_book/widget/chip.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/core.dart';
import '../controller/preference_book_controller.dart';

class PreferenceBookView extends StatelessWidget {
  const PreferenceBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(top: 60, right: 32, left: 32),
            ),
      ),
    );
  }
}