import 'package:ecommerceproject/scaffolds/OrdersScreen.dart';
import 'package:ecommerceproject/scaffolds/login.dart';
import 'package:ecommerceproject/shared/widgets/customedappbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import './ProductScreen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
          "Admin Panle",
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
            },
          )),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductScreenAdmin()));
                },
                child: const Card(
                  child: Center(
                    child: Text('Go To Products'),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrdersScreen()));
                },
                child: const Card(
                  child: Center(
                    child: Text('Go To Orders'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
