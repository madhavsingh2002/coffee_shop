import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemToCart(coffee);
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
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: coffeeShop.userCart
                      .length, // Assuming coffeeShop has a coffees list
                  itemBuilder: (context, index) {
                    Coffee eachCoffee =
                        coffeeShop.userCart[index]; // Access coffees list
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeToCart(eachCoffee),
                      icon: Icon(Icons.delete, color: Colors.red[300]),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(color: Colors.white),
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
