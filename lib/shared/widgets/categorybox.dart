import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  String name;
  CategoryBox(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage("assets/images/back (2).jpg"),
            fit: BoxFit.cover,
          )),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black54.withOpacity(0.25),
              borderRadius: BorderRadius.circular(15),
            ),
            width: 150,
            height: 120,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                )),
          )
        ],
      ),
    );
  }
}
