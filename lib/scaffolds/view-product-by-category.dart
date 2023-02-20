import 'package:ecommerceproject/shared/widgets/customedappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../authentication/home/home_services.dart';
import '../models/product.dart';

class ViewProductsByCategory extends StatefulWidget {
  final String category;
  const ViewProductsByCategory({super.key, required this.category});

  @override
  State<ViewProductsByCategory> createState() => _ViewProductsByCategoryState();
}

class _ViewProductsByCategoryState extends State<ViewProductsByCategory> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(widget.category, null),
      body: productList == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    color: Colors.grey[300],
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 1 / 1.58,
                      children: List.generate(
                        productList!.length,
                        (index) => Container(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           DetailsScreen(product: Product[index]),
                              //     ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          productList![index].images[0]),
                                      width: double.infinity,
                                      height: 200.0,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productList![index].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          height: 1.5,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            productList![index]
                                                .price
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.pinkAccent),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
