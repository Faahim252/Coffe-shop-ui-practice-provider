import 'package:coffe_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CofeeShop extends ChangeNotifier {
  // cofee for sale list

  final List<Coffee> _shop = [
    // black cofee
    Coffee(
      name: 'Long Black',
      price: '1.5',
      imagepath: 'lib/assets/coffee-mug.png',
    ),
    // late cofee
    Coffee(
      name: 'Late',
      price: '4.99',
      imagepath: 'lib/assets/late.jpg',
    ),
    // cold cofee
    Coffee(
      name: 'Iced coffe',
      price: '3.99',
      imagepath: 'lib/assets/cold-coffee.png',
    ),
    //espareso
    Coffee(name: 'espareso', price: '2.88', imagepath: 'lib/assets/daimond.jpg')
  ];

  // user cart

  List<Coffee> _UserCart = [];
  //get coffee list
  List<Coffee> get CoffeeShop => _shop;
  // get user cart
  List<Coffee> get user => _UserCart;
  // additem to the cart
  void AddItemToCart(Coffee coffee) {
    _UserCart.add(coffee);
    notifyListeners();
  }

  // remove item from the cart

  void RemoveItemFromCart(Coffee coffee) {
    _UserCart.remove(coffee);
    notifyListeners();
  }
}
