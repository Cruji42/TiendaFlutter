import 'package:flutter/material.dart';
import './model/product.dart';

class CartProvider with ChangeNotifier {

  List<Product> _itemsCart = List<Product>();
  List<Product> get itemsCart => _itemsCart;

//  String _authToken = '';
//  String get authToken => _authToken;

  void addObjectToCart(Product product) {
    if(!_itemsCart.asMap().containsValue(product.id)){
      _itemsCart.add(product);
      notifyListeners();
    }
  }

  void removeObjectFromCart(String id) {
    _itemsCart.removeWhere((product) => product.id == id);
    notifyListeners();
  }

//  void setAuthToken(String token) {
//    this._authToken = token;
//  }
}