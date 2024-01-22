import 'package:flutter/material.dart';
import 'package:squeeky/screens/categories.dart';
import 'package:squeeky/screens/delivery.dart';
import 'package:squeeky/screens/messages.dart';
import 'package:squeeky/screens/basket.dart';
import 'package:squeeky/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  int currentIndex;
  HomeScreen({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List pages = [
    Delivery(),
    Categories(),
    Basket(),
    InboxMessagesScreen(),
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
           widget.currentIndex = index;
          });
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
            icon: Icon(Icons.chat_bubble_outline_outlined),
            label: "Messages"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account'
          )
        ],
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        ),

        body: pages[widget.currentIndex] ,
    );
  }
}