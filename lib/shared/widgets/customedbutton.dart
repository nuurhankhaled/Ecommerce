import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  dynamic buttonChild=Text('khfdkgd');
  dynamic color = Colors.white;
  dynamic  bordercolor = Colors.transparent;
  final VoidCallback ontap;
  Button(this.buttonChild, this.color, this.bordercolor, this.ontap);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:bordercolor,
          width:2,
        ),
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child:ClipRRect(
        child: MaterialButton(
          onPressed: ontap,
          child: buttonChild,
          minWidth: 350,
          height: 50,
        ),
      ),
    );
  }
}