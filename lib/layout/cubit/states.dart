abstract class AppStates {}
class AppInitialState extends AppStates{}
class ShopChangeBottonNavBarState extends AppStates{}

class ShopHomeDataLoadingState extends AppStates{}
class ShopHomeDataSuccessState extends AppStates{}
class ShopHomeDataErrorState extends AppStates{
  final String error ;
  ShopHomeDataErrorState(this.error);
}

