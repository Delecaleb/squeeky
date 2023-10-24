import 'package:flutter/material.dart';
import 'package:squeeky/widgets.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourites'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          FavouritesWidget(imageLink: 'https://picsum.photos/250?image=1', title: 'Lawn Mowing Business', subSubTitle: 'subSubTitle', subTitle: 'subTitle'),
          SizedBox(height: 20,),
          FavouritesWidget(imageLink: 'https://picsum.photos/250?image=1', title: 'Lawn Mowing Business', subSubTitle: 'subSubTitle', subTitle: 'subTitle'),
          SizedBox(height: 20,),
          FavouritesWidget(imageLink: 'https://picsum.photos/250?image=1', title: 'Lawn Mowing Business', subSubTitle: 'subSubTitle', subTitle: 'subTitle')
        ],
      ),
    );
  }
}