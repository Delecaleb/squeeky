import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/rating_controller.dart';
import 'package:squeeky/style/textstyles.dart';

class RatingServicesScreen extends StatelessWidget {
  String imagePath, businessName,  businessId;
  List<String> serviceId; 
  List<String> orderId ;
  
  RatingServicesScreen({Key? key, required this.businessName, required this.imagePath, required this.orderId, required this.serviceId, required this.businessId}) : super(key: key);
  RatingController ratingController = Get.put(RatingController());
  @override
  Widget build(BuildContext context) {
    ratingController.verifyAlreadyRated(businessId, serviceId, orderId);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Obx(() {
          return Column(
            children: [
              Container(
                        padding: EdgeInsets.symmetric(horizontal:20, vertical: 25),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage('https://squeeky.org/dashboard/businessfiles/$imagePath'),
                          fit: BoxFit.cover
                          ),
                        ),
                        width: Get.width,
                        height: Get.height * 0.2,
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      
                      Text('How was $businessName  Service?', style: text26, textAlign: TextAlign.center,),
                      Text('Give a thumbs up for good delivery.'),
                      SizedBox(height: 30,),
                      // Rating
                      Obx(() {
                          return RatingBar.builder(
                            initialRating:ratingController.initialRate.value,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5, 
                            // ignoreGestures: ratingController.ratingStatus.value,
                            itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,), 
                            onRatingUpdate: (double value) { 
                              ratingController.showBtn(true);
                              ratingController.initialRate(value);
                              
                             },
                          );
                        }
                      ),
                      SizedBox(height: 30,),
                      Text('Get Help', style: TextStyle(color: Color(0xFF0F984A), fontSize: 17),),
                      SizedBox(height: 30,),
                      Text('Thanks for Ordering!', style: text26,),
                      Text('Your order total was \${}.'),
                    ],
                  ),
                )
                ),
              if(ratingController.showBtn.value )...[
      
              ElevatedButton(
                  onPressed: ratingController.ratingStatus.value ? null : (){
                    // add rating
                    ratingController.rateService(businessId, serviceId, orderId, ratingController.initialRate.value.toString());
                    Get.to(()=>RateResponse(name: ratingController.userName));
                  },
                  child: Text('Submit', style: btnBoldLight,),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: const Color(0xFF000000),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                  ),
                )
              ] 
            ],
          );
        }
      ),
    );
  }
}

class RateResponse extends StatelessWidget {
  String name;
   RateResponse({ required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: Get.height *0.9,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Thanks for using Squeeky,${name}', style: text34, textAlign: TextAlign.center,),
              // Spacer(),
              Container(
                width: Get.width,
                height: Get.height * 0.27,
                decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: AssetImage('assets/rs.png'),
                  fit: BoxFit.cover,
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}