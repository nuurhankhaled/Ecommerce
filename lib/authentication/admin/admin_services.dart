import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ecommerceproject/authentication/error_handeling.dart';
import 'package:ecommerceproject/main.dart';
import 'package:ecommerceproject/models/product.dart';
import 'package:ecommerceproject/models/user_detailes.dart';
import 'package:ecommerceproject/shared/widgets/util.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  Future<void> sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      final cloudinary = CloudinaryPublic("dihm6p7dt", "lbnuwnwn");
      List<String> imageUrls = [];
      for (var i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);
      http.Response res = await http.post(
        Uri.parse("$uri/admin/add-product"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: product.toJson(),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Utils().showSnackBar(
                context: context, content: "Product added successfully!");
            Navigator.pop(context);
          });
    } catch (e) {
      Utils().showSnackBar(context: context, content: e.toString());
    }
  }

  // get all the products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      Utils().showSnackBar(context: context, content: e.toString());
    }
    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      Utils().showSnackBar(context: context, content: e.toString());
    }
  }

  // Future<List<Order>> fetchAllOrders(BuildContext context) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   List<Order> orderList = [];
  //   try {
  //     http.Response res =
  //         await http.get(Uri.parse('$uri/admin/get-orders'), headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'x-auth-token': userProvider.user.token,
  //     });

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         for (int i = 0; i < jsonDecode(res.body).length; i++) {
  //           orderList.add(
  //             Order.fromJson(
  //               jsonEncode(
  //                 jsonDecode(res.body)[i],
  //               ),
  //             ),
  //           );
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  //   return orderList;
  // }

  // void changeOrderStatus({
  //   required BuildContext context,
  //   required int status,
  //   required Order order,
  //   required VoidCallback onSuccess,
  // }) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);

  //   try {
  //     http.Response res = await http.post(
  //       Uri.parse('$uri/admin/change-order-status'),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode({
  //         'id': order.id,
  //         'status': status,
  //       }),
  //     );

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: onSuccess,
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }
}
