import 'dart:convert';

import 'package:ecommerceproject/authentication/error_handeling.dart';
import 'package:ecommerceproject/main.dart';
import 'package:ecommerceproject/models/user_detailes.dart';
import 'package:ecommerceproject/scaffolds/AdminHomeScreen.dart';
import 'package:ecommerceproject/scaffolds/layoutScreen.dart';
import 'package:ecommerceproject/shared/widgets/util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthhService {
  //sign up
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      User user = User(
          id: "",
          name: name,
          email: email,
          password: password,
          phone: phone,
          type: "",
          token: "",
          cart: []);
      http.Response res = await http.post(
        Uri.parse("$uri/api/signup"), body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }, // 3shan el middleware express f index
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Utils().showSnackBar(
                context: context, content: "Account Created Successfully!");
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ShopLayOutScreen()),
                (route) => false);
          });
    } catch (e) {
      Utils().showSnackBar(context: context, content: e.toString());
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          //   Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await sharedPreferences.setString(
              'x-auth-token', jsonDecode(res.body)['token']);
          await sharedPreferences.setString(
              "name", jsonDecode(res.body)['name']);
          await sharedPreferences.setString(
              "phone", jsonDecode(res.body)['phone']);
          await sharedPreferences.setString(
              "email", jsonDecode(res.body)['email']);
          //  Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          (jsonDecode(res.body)['type'] == "user")
              ? Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ShopLayOutScreen()),
                  (route) => false)
              : Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AdminHomeScreen()),
                  (route) => false);
        },
      );
    } catch (e) {
      Utils().showSnackBar(context: context, content: e.toString());
    }
  }
}
