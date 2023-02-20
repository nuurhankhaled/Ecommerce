// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ecommerceproject/responsivness/responsivness.dart';
import 'package:ecommerceproject/scaffolds/signup.dart';
import 'package:flutter/material.dart';
import '../authentication/auth_service.dart';
import '../authentication/authentication_methods.dart';
import '../shared/widgets/customedbutton.dart';
import '../shared/widgets/customedtextfield.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Login extends StatefulWidget {
  TextEditingController? email = TextEditingController();

  TextEditingController? password = TextEditingController();
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var width, height, size;
  final AuthService authService = AuthService();
  void signInUser() {
    authService.signInUser(
      context: context,
      email: widget.email!.text,
      password: widget.password!.text,
    );
  }

  bool passwordVisible = false;
  bool isSecure = true;

  final formKey = GlobalKey<FormState>();
  final AuthhService authhService = AuthhService();
/*  void signInUser() {
    authService.signInUser(
        context: context,
        email: widget.email!.text,
        password: widget.password!.text);
  }*/

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 131, 153, 1),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: const Text(
                  'Welcome,',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'sign',
                      fontSize: 35),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: const Text(
                  'Glad to see you!',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'sign', fontSize: 35),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Responsive.screenHeight * 0.05),
                child: Container(
                  width: Responsive.screenWidth,
                  height: Responsive.screenHeight * 0.728,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(150))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.15,
                            left: width * 0.05,
                            right: width * 0.05),
                        child: FormFields(
                            "Email",
                            const Icon(
                              Icons.mail,
                              color: Colors.black,
                            ),
                            null,
                            false,
                            widget.email!,
                            Colors.transparent,
                            Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.05,
                            left: width * 0.05,
                            right: width * 0.05),
                        child: FormFields(
                            "Password",
                            IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.lock_open
                                    : Icons.lock_outline,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  isSecure = !isSecure;
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  isSecure = !isSecure;
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            isSecure,
                            widget.password!,
                            Colors.transparent,
                            Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.1),
                        child: Button(
                            const Text('LogIn',
                                style: TextStyle(
                                    fontFamily: 'sign',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white)),
                            const Color.fromRGBO(4, 131, 153, 1),
                            Colors.transparent, () async {
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            print("testetstetgegs");
                            signInUser();
                          }
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.01, left: width * 0.15),
                        child: Row(
                          children: [
                            const Text(
                              'Don\'t have an account',
                              style: TextStyle(
                                  fontFamily: 'sign',
                                  fontSize: 15,
                                  color: Colors.black,
                                  decorationColor: Colors.white),
                            ),
                            GestureDetector(
                              child: const Text(
                                '?SignUp now',
                                style: TextStyle(
                                    fontFamily: 'sign',
                                    fontSize: 17,
                                    color: Colors.black54,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black54),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
