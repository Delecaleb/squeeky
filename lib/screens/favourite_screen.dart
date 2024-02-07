import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/style/textstyles.dart';
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
                if(favouritesController.isloading.value){
                  return ShimmerLoader();
                }
              else if (favouritesController.favourites.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/tool.jpg"),
                SizedBox(height: 20,),
                Text("No Business added to favourite yet", style: text18,),
              ],
            );
          } else {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              itemCount: favouritesController.favourites.length+1,
              itemBuilder: (context, index) {
                if(index==0){
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:15.0),
                        child: Text('Recently added', style: text21,),
                      ),
                    );
                }else{

                final favouriteList = favouritesController.favourites[index-1];
                return InkWell(
                  onTap: ()async{
                     favouritesController.getBusinessDetails(favouriteList.businessId);
                     
                  },
                  child: FavouritesWidget(
                            imageLink: 'https://squeeky.org/dashboard/businessfiles/${favouriteList.imagePath}',
                            title: favouriteList.businessName,
                            subSubTitle: '\$1.79 Delivery Fee',
                            subTitle:'20 mins' 
                          ),
                );
              }
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