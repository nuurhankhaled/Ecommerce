// import 'package:ecommerceproject/scaffolds/payment.dart';
// import 'package:flutter/material.dart';

// import '../shared/widgets/customedappbar.dart';
// import 'customshopping.dart';

// class Shopping extends StatelessWidget {
//   var height, width, size;

//   //Product? product;
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     height = size.height;
//     width = size.width;
//     // TODO: implement build
//     return Scaffold(
//       appBar: CustomedAppBar("Shopping Cart", null),
//       body: Column(
//         children: [
//           Flexible(
//             child: ListView.separated(
//               itemCount: 3,
//               separatorBuilder: (BuildContext context, int index) => SizedBox(
//                 height: 5,
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 return Custom(
//                     "https://res.cloudinary.com/dihm6p7dt/image/upload/v1671207014/Soda%20Glove%20-%20Ankle%20Boot%20w/Lug%20Sole%20Elastic%20Gore%20and%20Chunky%20Heel/yewky22lvqbgv5suoqsr.jpg",
//                     "Soda Glove - Ankle Boot w/Lug Sole Elastic Gore and Chunky Heel",
//                     "460");
//               },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: width * 0.1),
//             child: SizedBox(
//               height: 50,
//               child: Row(
//                 children: [
//                   Text(
//                     "Subtotal",
//                     style: TextStyle(
//                         color: Colors.grey[500],
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: width * 0.4),
//                     child: Text(
//                       "6738",
//                       style: TextStyle(
//                           color: Colors.grey[500],
//                           fontWeight: FontWeight.w700,
//                           fontSize: 18),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: width * 0.1),
//             child: Row(
//               children: [
//                 Text(
//                   "Shipping fees",
//                   style: TextStyle(
//                       color: Colors.grey[500],
//                       fontWeight: FontWeight.w700,
//                       fontSize: 18),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: width * 0.3),
//                   child: Text(
//                     "60",
//                     style: TextStyle(
//                         color: Colors.grey[500],
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: width * 0.2,
//               right: width * 0.2,
//               top: width * 0.08,
//               bottom: width * 0.05,
//             ),
//             child: MaterialButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Payment()));
//               },
//               child: Text(
//                 "Checkout",
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white),
//               ),
//               color: Color.fromRGBO(4, 131, 153, 1),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:ecommerceproject/scaffolds/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import '../shared/widgets/product_cart.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                color: const Color.fromRGBO(4, 131, 153, 1)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15, right: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: (String query) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchScreen(searchQuery: query)));
                      },
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                          top: 10,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search ',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: 1,
            ),
            const SizedBox(height: 5),
            ListView.builder(
              itemCount: user.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartProduct(
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
