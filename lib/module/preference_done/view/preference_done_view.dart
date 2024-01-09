import 'package:bookapp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PreferenceDoneView extends StatefulWidget {
  const PreferenceDoneView({super.key});

  @override
  State<PreferenceDoneView> createState() => _PreferenceDoneViewState();
}

class _PreferenceDoneViewState extends State<PreferenceDoneView> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavigationBar(
      //   labelBehavior: labelBehavior,
      //   selectedIndex: currentPageIndex,
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       currentPageIndex = index;
      //     });
      //   },
      //   destinations: const <Widget>[
      //     NavigationDestination(
      //       icon: Icon(Icons.explore),
      //       label: 'Explore',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.commute),
      //       label: 'Commute',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.bookmark),
      //       icon: Icon(Icons.bookmark_border),
      //       label: 'Saved',
      //     ),
      //   ],
      // ),
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
                          return HomeView();
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
