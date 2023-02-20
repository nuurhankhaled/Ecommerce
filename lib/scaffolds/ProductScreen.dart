import 'package:ecommerceproject/authentication/admin/admin_services.dart';
import 'package:ecommerceproject/models/product.dart';
import 'package:ecommerceproject/scaffolds/view-product.dart';
import 'package:ecommerceproject/shared/widgets/customedappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './AddNewProductScreen.dart';
import 'AdminHomeScreen.dart';

class ProductScreenAdmin extends StatefulWidget {
  const ProductScreenAdmin({super.key});

  @override
  State<ProductScreenAdmin> createState() => _ProductScreenAdminState();
}

class _ProductScreenAdminState extends State<ProductScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar("Products", null),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNewProductScreen()));
                },
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Color.fromRGBO(4, 131, 153, 0.5),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNewProductScreen()));
                        },
                      ),
                      Text(
                        'Add New Product',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewProductPage()));
                  },
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Color.fromRGBO(4, 131, 153, 0.5),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.view_agenda_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewProductPage()));
                          },
                        ),
                        Text(
                          'View All Products',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
