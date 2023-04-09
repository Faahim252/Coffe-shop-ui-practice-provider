import 'package:coffe_shop/Components/coffee_title.dart';
import 'package:coffe_shop/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee_shop.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  //Remove item
  void removeFromcard(Coffee coffee) {
    Provider.of<CofeeShop>(context, listen: false).RemoveItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                'your Cart',
                style: TextStyle(fontSize: 20),
              ),

              /// list of cart items
              Expanded(
                child: ListView.builder(
                    itemCount: value.user.length,
                    itemBuilder: ((context, index) {
                      // get indivitual cart item
                      Coffee eachCoffe = value.user[index];
                      return CoffeTitle(
                          coffee: eachCoffe,
                          onPressed: () => removeFromcard(eachCoffe),
                          icon: Icon(Icons.delete));
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
