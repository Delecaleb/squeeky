import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/widgets.dart';

import '../controllers/fetch_favourites_controller.dart';

class FavouriteScreen extends StatelessWidget {

  final FetchFavouriteController favouritesController = Get.put(FetchFavouriteController());
  
  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourites'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          
          Obx(() {
              if (favouritesController.favourites.isEmpty) {
            return Center(
              child: ShimmerLoader(),
            );
          } else {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              itemCount: favouritesController.favourites.length,
              itemBuilder: (context, index) {
                final favouriteList = favouritesController.favourites[index];
                return FavouritesWidget(
                          imageLink: 'https://picsum.photos/250?image=1',
                          title: favouriteList.businessName,
                          subSubTitle: '\$1.79 Delivery Fee',
                          subTitle:'20 mins' 
                        );
              },
            );
          }
            }
          ),
        ],
      ),
    );
  }
}