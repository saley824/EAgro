import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '/models/user_model.dart';

class MainProvider extends ChangeNotifier {
  UserModel? user;

  ValueNotifier<int> cartCount = ValueNotifier<int>(0);
   
  bool isShop() {
    return user?.isShop ?? false;
  }

  String getId() {
    return user?.id ?? "";
  }

setCartCount(int newCartCount){
 if(newCartCount != cartCount.value){
   cartCount.value = newCartCount;
 
 }
}

getCountCart()async{
   final cartCountModel = await CartService.getCartCount(user?.id ?? "");
   cartCount.value = cartCountModel?.count ?? cartCount.value ;

}


 incrementCartCount(){
  cartCount.value++;

 }
 decrementCartCount(){
  cartCount.value--;
 }

  refresh() {
    notifyListeners();
  }
}
