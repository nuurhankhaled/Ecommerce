// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ecommerceproject/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import '../responsivness/responsivness.dart';
import '../shared/widgets/customedbutton.dart';
import '../shared/widgets/customedtextfield.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  TextEditingController? name = TextEditingController();
  TextEditingController? phone = TextEditingController();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var width, height, size;
  final AuthService authService = AuthService();
  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: widget.email!.text,
      password: widget.password!.text,
      name: widget.name!.text,
      phone: widget.phone!.text,
    );
  }

  bool passwordVisible = false;
  bool isSecure = true;
  final formKey = GlobalKey<FormState>();

  /*void signUpUser() {
    authService.signUpUser(
        context: context,
        email: widget.email!.text,
        password: widget.password!.text,
        name: widget.name!.text,
        phone: widget.phone!.text);
  }*/

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 131, 153, 1),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.075),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'sign',
                      fontSize: 35),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: Text(
                  'to get started now!',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'sign', fontSize: 35),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Responsive.screenHeight * 0.04),
                child: Container(
                  width: Responsive.screenWidth,
                  height: Responsive.screenHeight * 0.762,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(150))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.1,
                            left: width * 0.05,
                            right: width * 0.05),
                        child: FormFields(
                            "Name",
                            Icon(
                              Icons.perm_identity,
                              color: Colors.black,
                            ),
                            null,
                            false,
                            widget.name!,
                            Colors.transparent,
                            Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.01,
                            left: width * 0.05,
                            right: width * 0.05),
                        child: FormFields(
                            "Email",
                            Icon(
                              Icons.email,
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
                            top: height * 0.01,
                            left: width * 0.05,
                            right: width * 0.05),
                        child: FormFields(
                            "Phone",
                            Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            null,
                            false,
                            widget.phone!,
                            Colors.transparent,
                            Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.01,
                            left: width * 0.05,
                            right: width * 0.05),
                        child: FormFields(
                            "PassWord",
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
                            Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: Button(
                            Text('SignUp',
                                style: TextStyle(
                                    fontFamily: 'sign',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white)),
                            Color.fromRGBO(4, 131, 153, 1),
                            Colors.transparent, () {
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            print("HE?YYYY---");
                            signUpUser();
                          }
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.01, left: width * 0.15),
                        child: Row(
                          children: [
                            Text(
                              'Already have an account',
                              style: TextStyle(
                                  fontFamily: 'sign',
                                  fontSize: 15,
                                  color: Colors.black,
                                  decorationColor: Colors.white),
                            ),
                            GestureDetector(
                              child: Text(
                                '?LogIn now',
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
                                        builder: (context) => Login()));
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
