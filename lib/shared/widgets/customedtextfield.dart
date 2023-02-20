import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();
  dynamic prefix;
  dynamic suffix;
  dynamic fillcolor;
  String x = "";
  dynamic color;
  bool IsObsecure;
  FormFields(this.x, this.prefix, this.suffix, this.IsObsecure,
      this.textFieldController, this.fillcolor, this.color);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(
            height: 1.8,
            color: Colors.black,
            fontFamily: 'sign',
            fontWeight: FontWeight.w500),
        validator: (String? text) {
          if (textFieldController.text == '') {
            return 'This Field is Required.';
          }
        },
        obscureText: IsObsecure,
        cursorColor: Colors.black,
        controller: textFieldController,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          filled: true,
          fillColor: fillcolor,
          floatingLabelStyle:
              const TextStyle(color: Color.fromRGBO(4, 131, 153, 1)),
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(4, 131, 153, 1),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          labelText: x,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            //borderSide: BorderSide(color: Colors.white, width: 3)
          ),
        ));
  }
}
