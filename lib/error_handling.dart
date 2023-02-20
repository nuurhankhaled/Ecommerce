import 'dart:convert';

import 'package:ecommerceproject/shared/widgets/util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      Utils().showSnackBar(
          context: context, content: jsonDecode(response.body)['msg']);
      break;
    case 500:
      Utils().showSnackBar(
          context: context, content: jsonDecode(response.body)['error']);
      break;
    default:
      Utils().showSnackBar(context: context, content: response.body);
  }
}
