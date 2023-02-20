import 'dart:convert';

import 'package:ecommerceproject/provider/user_provider.dart';
import 'package:ecommerceproject/shared/widgets/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../../models/product.dart';
import '../../models/user_detailes.dart';
import '../error_handeling.dart';

class ProductDetailsServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      print(userProvider.user.token);
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
          Utils().showSnackBar(
              context: context, content: "Product added to cart seccessfully");
        },
      );
    } catch (e) {
      Utils().showSnackBar(context: context, content: e.toString());
    }
  }
}
