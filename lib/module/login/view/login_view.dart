import 'package:bookapp/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscurePassword = true;
  final formkey = GlobalKey<FormState>();
  String email = "", password = "";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    userLogin() async {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Get.to(const SignUpSuccessView());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            'No User Found for that email',
            style: GoogleFonts.montserrat(fontSize: 20),
          )));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            'Wrong Password Provided by User',
            style: GoogleFonts.montserrat(fontSize: 20),
          )));
        }
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: double.infinity,
            child: Image.asset(
              'assets/image/login.jpg',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, There!',
                      style: GoogleFonts.montserrat(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Glad to see you back! Let's sign you in first.",
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ButtonBlue(
                      label: 'Sign In',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          email = emailcontroller.text;
                          password = passwordcontroller.text;
                          userLogin();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.phone_sharp),
                                Text(
                                  'Sign In with Phone',
                                  style: GoogleFonts.roboto(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              AuthMethoods().signInWithGoogle(context);
                            },
                            child: Container(
                              // width: MediaQuery.of(context).size.width,
                              height: 55,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/image/google.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                  Text(
                                    'Sign In with Google',
                                    style: GoogleFonts.roboto(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Doesn't have any account?",
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpView()));
                          },
                          child: Text(
                            'Sign Up Here!',
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
        ],
      ),
    );
  }
}
