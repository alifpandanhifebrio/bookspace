import 'package:bookapp/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _obscurePassword = true;
  String name = "",
      gender = "",
      birhday = "",
      username = "",
      email = "",
      password = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController birthdaycontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (usernamecontroller.text != "" && emailcontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Registration Succesfully',
          style: GoogleFonts.montserrat(fontSize: 20),
        )));
        Get.to(const SignUpSuccessView());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Password Provided is too weak',
                style: GoogleFonts.montserrat(fontSize: 20),
              )));
        } else if (e.code == "email-already-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Account Already Exists',
                style: GoogleFonts.montserrat(fontSize: 20),
              )));
        }
      }
    }
  }

  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            onPageChanged: (index) {
              print('Page ${index + 1}');
            },
            controller: controller,
            children: [
          Stack(children: [
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
                      TextFormField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: gendercontroller,
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
                        controller: birthdaycontroller,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () async {
                                DateTime? pickdate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (pickdate != null) {
                                  setState(() {
                                    birthdaycontroller.text =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickdate);
                                  });
                                }
                              },
                              child: const Icon(Icons.calendar_month_outlined)),
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
                          onPressed: () => controller.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut),
                        ),
                      ),
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
          ]),
          Stack(children: [
            Container(
              alignment: Alignment.topCenter,
              color: const Color(0xffabd1ff),
              child: Image.asset(
                'assets/image/sign_up_2.jpg',
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
                        'Almost There...',
                        style: GoogleFonts.montserrat(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Now, Let's set up your account",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Username';
                                }
                                return null;
                              },
                              controller: usernamecontroller,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                hintText: 'Username',
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Email';
                                }
                                return null;
                              },
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              obscureText: _obscurePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              controller: passwordcontroller,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                  child: Icon(_obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                contentPadding: const EdgeInsets.all(20),
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
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
                                onPressed: () => controller.previousPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut),
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
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = emailcontroller.text;
                                      username = usernamecontroller.text;
                                      password = passwordcontroller.text;
                                    });
                                  }
                                  registration();
                                  // Navigator.pushAndRemoveUntil(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (BuildContext context) {
                                  //       return const SignUpSuccessView();
                                  //     },
                                  //   ),
                                  //   (route) => true,
                                  // );
                                },
                                child: Text(
                                  'Next',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                              Navigator.popUntil(context,
                                  (Route<dynamic> route) => route.isFirst);
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
          ])
        ]));
  }
}
