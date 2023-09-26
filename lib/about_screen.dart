import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('About'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              title: Text('Like us on Facebook'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              title: Text('Legals'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              title: Text('SqueekyEats.com'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            
          ],
        ),
      ),
    );
  }
}