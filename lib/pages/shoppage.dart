import 'package:coffe_shop/Components/coffee_title.dart';
import 'package:coffe_shop/models/coffee.dart';
import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  // addto card
  void AddtoCard(Coffee coffee) {
    Provider.of<CofeeShop>(context, listen: false).AddItemToCart(coffee);

    //show message
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Seccesfully added to the Card'),
            ));
  }

  void paynow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<CofeeShop>(
      builder: (context, value, Child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                'How would like your coffee?',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.CoffeeShop.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffe = value.CoffeeShop[index];
                    return CoffeTitle(
                      coffee: eachCoffe,
                      onPressed: () => AddtoCard(eachCoffe),
                      icon: Icon(Icons.add),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: paynow,
                child: Container(
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.brown),
                  child: Center(
                    child: Text(
                      'pay Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
