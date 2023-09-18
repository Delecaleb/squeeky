import 'package:flutter/material.dart';
import 'package:squeeky/screens/categories.dart';
import 'package:squeeky/screens/delivery.dart';
import 'package:squeeky/screens/orders.dart';
import 'package:squeeky/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List pages = [
    Delivery(),
    Categories(),
    Orders(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
      BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
          print(currentIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: 'Home'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Baskets'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account'
          )
        ],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        ),

        body: pages[currentIndex] ,
    );
  }
}