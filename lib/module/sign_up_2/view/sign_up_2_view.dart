// import 'package:bookapp/core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SignUp2View extends StatefulWidget {
//   const SignUp2View({Key? key}) : super(key: key);

//   Widget build(context, SignUp2Controller controller) {
//     controller.view = this;

//     return Scaffold(
//         body: Stack(children: [
//       Container(
//         alignment: Alignment.topCenter,
//         color: const Color(0xffabd1ff),
//         child: Image.asset(
//           'assets/image/sign_up_2.jpg',
//           width: MediaQuery.of(context).size.width,
//           fit: BoxFit.contain,
//         ),
//       ),
//       Align(
//         alignment: Alignment.bottomCenter,
//         child: FittedBox(
//           child: Container(
//             padding: const EdgeInsets.all(32),
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16)),
//                 color: Colors.white),
//             // height: 400,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Almost There...',
//                   style: GoogleFonts.montserrat(
//                       fontSize: 24, fontWeight: FontWeight.w700),
//                 ),
//                 const SizedBox(
//                   height: 8.0,
//                 ),
//                 Text(
//                   "Now, Let's set up your account",
//                   style: GoogleFonts.montserrat(
//                       fontSize: 14, fontWeight: FontWeight.w400),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 TextField(
//                   // controller: usernamec,
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.all(20),
//                     hintText: 'Username',
//                     border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.black),
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.all(20),
//                     hintText: 'Email',
//                     border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.black),
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     suffixIcon: const Icon(Icons.remove_red_eye_outlined),
//                     contentPadding: const EdgeInsets.all(20),
//                     hintText: 'Password',
//                     border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.black),
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                             width: 1,
//                             color: const Color(0xff1F73D6),
//                           ),
//                           borderRadius: BorderRadius.circular(8)),
//                       child: IconButton(
//                           style: const ButtonStyle(),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon:
//                               SvgPicture.asset('assets/icons/arrow_left.svg')),
//                     ),
//                     const SizedBox(
//                       width: 16.0,
//                     ),
//                     Expanded(
//                       child: SizedBox(
//                         height: 53,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8)),
//                               elevation: 0,
//                               backgroundColor: const Color(0xff1F73D6),
//                               foregroundColor: Colors.white),
//                           onPressed: () {
//                             Navigator.pushAndRemoveUntil(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (BuildContext context) {
//                                   return const SignUpSuccessView();
//                                 },
//                               ),
//                               (route) => true,
//                             );
//                           },
//                           child: Text(
//                             'Next',
//                             style: GoogleFonts.montserrat(
//                                 fontSize: 14, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Already have an account?",
//                       style: GoogleFonts.montserrat(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.popUntil(
//                             context, (Route<dynamic> route) => route.isFirst);
//                       },
//                       child: Text(
//                         'Sign In Here!',
//                         style: GoogleFonts.montserrat(
//                             color: Colors.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             decoration: TextDecoration.underline),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),  
//           ),
//         ),
//       ),
//     ]));
//   }

//   @override
//   State<SignUp2View> createState() => SignUp2Controller();
// }
