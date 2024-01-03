import 'package:bookapp/core.dart';
import 'package:flutter/material.dart';

import '../view/sign_up_2_view.dart';

class SignUp2Controller extends State<SignUp2View> {
  static late SignUp2Controller instance;
  late SignUp2View view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
