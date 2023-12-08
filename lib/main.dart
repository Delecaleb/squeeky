import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/screens/home.dart';
import 'package:squeeky/screens/signup.dart';
import 'package:squeeky/storage/app_getx_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key,});
  @override
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StorageService storage = StorageService();
  String? userPhone;
  
  @override
  void initState() {
    super.initState();
    getUserPhone();
  }

   void getUserPhone() async {
    String? phone = await storage.getString('userPhone');
    setState(() {
      userPhone = phone;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: userPhone !='' && userPhone !=null ? HomeScreen(currentIndex: 0,) : SignUp()), 
      // body: Center(
      //   child: Column(
      //     children: [
      //       SizedBox(height: 300,),
      //       Text("widget.userPhone"),
      //       Text(rr)
      //     ],
      //   ),
      // ),
    );
  }
}
