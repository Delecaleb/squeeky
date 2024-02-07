import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/business_controllers.dart';
import 'package:squeeky/screens/store_info.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class Search extends StatelessWidget {
  Search({super.key});
  BusinessController businessController = Get.put(BusinessController());
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      title: TextField(
      controller: searchController,
      onEditingComplete: (){
         if(searchController.text.isNotEmpty){
          businessController.fetchBusinessBaseOnInput(searchController.text);
         }
        },
      autocorrect: true,
      autofocus: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 18),
        border: InputBorder.none,
        labelText: 'car washing, home cleaning, etc.',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        
      ),
      ),
        ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Top Categories', style: titleText,),

            Obx(() {
                if(businessController.isloading.value){
                  return CircularProgressIndicator();
                }else{

                return businessController.businessSearchResult.length < 1 ? 
                Text("No business found")
                :
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: businessController.businessSearchResult.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    var businessData = businessController.businessSearchResult[index];
                    return BizContainerWidget( 
                      actionFunction: () => Get.to(()=>StoreInformation(business: businessData,)),
                      businessBanner: "https://squeeky.org/dashboard/businessfiles/${businessData.imagePath}", 
                      businessName: businessData.business_name, 
                      bussinessDesc: "${businessData.businessDesc}", 
                      businessRating: double.parse(businessData.businessRating)
                    );
                    // SizedBox(height: 20,),
                  },
                );
                }
              }
            )
            
          ],
        ),
      ),
    );
  }
}