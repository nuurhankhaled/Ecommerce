import 'package:ecommerceproject/scaffolds/view-product-by-category.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/categorybox.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  var categories = ['Mobiles', 'Essentials', 'Appliances', 'Books', 'Fashion'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //primary: false,
        slivers: <Widget>[
          SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                crossAxisCount: 3,
                //childAspectRatio: ,

                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewProductsByCategory(
                                  category: categories[index])));
                    },
                    child: CategoryBox(categories[index]),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
