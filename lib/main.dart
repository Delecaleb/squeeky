import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/checkout.dart';
import 'package:squeeky/screens/home.dart';
import 'package:squeeky/screens/orderlist.dart';
import 'package:squeeky/screens/payment_method.dart';
import 'package:squeeky/screens/placing_order.dart';
import 'package:squeeky/screens/ratingservices.dart';
import 'package:squeeky/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUp(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}