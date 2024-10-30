import 'package:flutter/material.dart';

import 'fakeproduct_model.dart';

class CartLogic extends ChangeNotifier{
  List<FakeProductModel> _cartList = [];
  List<FakeProductModel> get cartList => _cartList;

  void toggleProductInCart(FakeProductModel item){
    if(cartList.contains(item)){
      removeFromCart(item);
    }else{
      addToCart(item);
    }
  }

  void addToCart(FakeProductModel item){
    _cartList.add(item);
    notifyListeners();
  }

  void removeFromCart(FakeProductModel item){
    _cartList.remove(item);
    notifyListeners();
  }

  bool isProductInCart(FakeProductModel item){
    return _cartList.contains(item);
  }

  int get numOfItems => _cartList.length;

}