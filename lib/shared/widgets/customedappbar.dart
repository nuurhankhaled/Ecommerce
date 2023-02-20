import 'package:flutter/material.dart';

class CustomedAppBar extends StatelessWidget implements PreferredSizeWidget {
String title;
dynamic? icon;
CustomedAppBar(this.title,this.icon);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 75,
      title:  Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Text(
          title, style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
      ],
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(75);
}
