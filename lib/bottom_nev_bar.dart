import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // 🎨 Your Colors
  static const Color activeColor = Color(0xFFFA7A00); // Orange
  static const Color inactiveColor = Color(0xFF637381); // #637381

  final pages = const [
    Center(child: Text("Home")),
    Center(child: Text("Cart")),
    Center(child: Text("Favorite")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_currentIndex],

        bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          height: 65,
          backgroundColor: Colors.transparent,
          color: Colors.black, // nav background
          buttonBackgroundColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),

          items: [
            _buildNavItem("Home", "assets/home.png", 0),
            _buildNavItem("Cart", "assets/home.png", 1),
            _buildNavItem("Favorite", "assets/home.png", 2),
            _buildNavItem("Profile", "assets/home.png", 3),
          ],

          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  CurvedNavigationBarItem _buildNavItem(
      String label, String iconPath, int index) {
    final bool isSelected = _currentIndex == index;

    return CurvedNavigationBarItem(
      child: Image.asset(
        iconPath,
        height: 24,
        color: isSelected ? activeColor : inactiveColor,
      ),
      label: label,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: isSelected ? activeColor : inactiveColor,
      ),
    );
  }
}