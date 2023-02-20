import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../shared/widgets/util.dart';

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
      print(jsonDecode(response.body)['msg'].toString());
      Utils().showSnackBar(
          context: context, content: jsonDecode(response.body)['msg']);

      break;
    case 500:
      print("tesssssssssst");
      Utils().showSnackBar(
          context: context, content: jsonDecode(response.body)['error']);

      break;
    default:
      Utils().showSnackBar(context: context, content: response.body);
  }
}
