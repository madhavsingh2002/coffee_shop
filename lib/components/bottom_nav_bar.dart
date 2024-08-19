import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(color: Colors.brown[200], borderRadius: BorderRadius.circular(20.0)),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GNav(
          onTabChange: (value) => widget.onTabChange!(value),
          color: Colors.brown[600],
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.brown[900],
          tabBackgroundColor: Colors.grey.shade300,
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.white),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Shop',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.person,
              text: 'Account',
            )
          ]),
    );
  }
}
