import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.brown[400],
              title: const Text(
                "Successfully added to Cart",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, coffeeShop, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0), // Added const here
          child: Column(
            children: [
              const Text(
                'Welcome to our shop',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: coffeeShop.coffeeShop
                      .length, // Assuming coffeeShop has a coffees list
                  itemBuilder: (context, index) {
                    Coffee eachCoffee =
                        coffeeShop.coffeeShop[index]; // Access coffees list
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => addToCart(eachCoffee),
                      icon: Icon(Icons.add),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
