import 'package:badges/badges.dart';
import 'package:ecommerceproject/main.dart';
import 'package:ecommerceproject/provider/user_provider.dart';
import 'package:ecommerceproject/scaffolds/newcart.dart';
import 'package:ecommerceproject/scaffolds/searchscreen.dart';
import 'package:ecommerceproject/scaffolds/shopping.dart';
import 'package:ecommerceproject/shared/widgets/customedappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/cubit/layoutCubit.dart';
import '../layout/cubit/states.dart';

class ShopLayOutScreen extends StatefulWidget {
  const ShopLayOutScreen({Key? key}) : super(key: key);

  @override
  State<ShopLayOutScreen> createState() => _ShopLayOutScreenState();
}

class _ShopLayOutScreenState extends State<ShopLayOutScreen> {
  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 140,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  color: const Color.fromRGBO(4, 131, 153, 1)),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Welcome back",
                          style: TextStyle(fontSize: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Badge(
                            stackFit: StackFit.passthrough,
                            elevation: 1,
                            padding: EdgeInsets.all(6),
                            badgeColor: Colors.red.shade200,
                            badgeContent: Center(
                                child: Text(
                              userCartLen.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart_rounded,
                                size: 33,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Shopping()));
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          height: 49,
                          //margin: const EdgeInsets.only(left: 15),
                          child: Material(
                            color: Colors.transparent,
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
                                contentPadding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
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
                ],
              ),
            ),
          ),

          // appBar: CustomedAppBar(
          //     "Hello",
          //     IconButton(
          //       onPressed: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => Shopping()));
          //       },
          //       icon: Badge(
          //           badgeContent: Text(
          //             "5",
          //             style: TextStyle(
          //                 color: Colors.white, fontWeight: FontWeight.bold),
          //           ),
          //           badgeColor: Colors.red.shade200,
          //           child: Icon(
          //             Icons.shopping_cart_rounded,
          //             size: 30,
          //           )),
          //     )),
          body: AppCubit.get(context)
              .bottomNavBarList[AppCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              AppCubit.get(context).changeBottomNav(index, context);
            },
            currentIndex: AppCubit.get(context).currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined), label: 'search'),
            ],
          ),
        );
      },
    );
  }
}
