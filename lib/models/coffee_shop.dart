import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
        name: 'Black tea', 
        price: "4.10", 
        imagePath: 'assets/coffee-cup.png'
    ),
    Coffee(
        name: 'Cold Coffee', 
        price: "19.10", 
        imagePath: 'assets/coffee.png'
    ),
    Coffee(
        name: 'Lattie', 
        price: "12.10", 
        imagePath: 'assets/worker.png'
    ),
    Coffee(
        name: 'Tea', 
        price: "17.10", 
        imagePath: 'assets/coffee-beans.png'
    )
  ];
  // User cart
  List<Coffee> _userCart = [];

  // Get Coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }
  // remove item to cart
  void removeItemToCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
}
