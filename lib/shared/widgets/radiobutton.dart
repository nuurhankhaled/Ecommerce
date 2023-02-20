import 'package:flutter/material.dart';

import '../../scaffolds/newcart.dart';


var height, width, size;


class RadioButton extends StatefulWidget {
  String text = "";
  String selected = "off";
  String text2 = "";
  RadioButton(
      {Key? key,
      required this.text,
      required this.selected,
      required this.text2})
      : super(key: key);
  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  dynamic defultColor = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
        padding: EdgeInsets.fromLTRB(
            width * 0.01, width * 0.02, width * 0.02, width * 0.01),
        child: Container(
          width: width * 0.9,
          height: height * 0.085,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
          color: defultColor, //color of border
            width: 2, //width of border
          ),
          ),
          child: RadioListTile(
              title: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewCard()));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          width * 0.01, width * 0.02, width * 0.02, width * 0.01),
                      child: Text(widget.text),
                    ),
                    Text(
                      widget.text2,
                      style: TextStyle(color: Colors.grey.shade300, fontSize: 10),
                    ),
                  ],
                ),
              ),
              value: "on",
              groupValue: widget.selected,
              onChanged: (value) {
                setState(
                  () {
                    widget.selected = value.toString();
                    if (widget.selected == 'on') {
                      defultColor =Colors.blue;
                    }
                  },
                );
              }),
        ));
  }
}
