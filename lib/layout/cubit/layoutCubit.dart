import '../../scaffolds/categoriesScreen.dart';
import '../../scaffolds/searchscreen.dart';
import '../../scaffolds/productsScreen.dart';
import 'states.dart'
    show AppInitialState, AppStates, ShopChangeBottonNavBarState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomNavBarList = [
    const ProductsScreen(),
    CategoriesScreen(),
    CategoriesScreen()
  ];

  void changeBottomNav(int index, context) {
    currentIndex = index;
    emit(ShopChangeBottonNavBarState());
  }
}
