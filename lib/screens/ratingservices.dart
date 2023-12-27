import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/style/textstyles.dart';

import '../providers/api_data_provider.dart';

class RatingServicesScreen extends StatefulWidget {
  String imagePath, businessName,  businessId;
  List<String> serviceId; 
  List<String> orderId ;
  
  RatingServicesScreen({Key? key, required this.businessName, required this.imagePath, required this.orderId, required this.serviceId, required this.businessId}) : super(key: key);

  @override
  State<RatingServicesScreen> createState() => _RatingServicesScreenState();
}

class _RatingServicesScreenState extends State<RatingServicesScreen> {
  double initialRate = 0;
  final box = GetStorage();

  late String userId;
  late bool status = false;
  late double currentRate;

  final apiProvider = ApiDataProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = box.read('userPhone');

    apiProvider.checkServiceRating(widget.businessId, userId, widget.serviceId, widget.orderId).then((value){
      setState(() {
        status = value['status'];
        initialRate = value['rate'];
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Container(
                    padding: EdgeInsets.symmetric(horizontal:20, vertical: 25),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage('https://learncrib.com.ng/squeeky/dashboard/businessfiles/${widget.imagePath}'),
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
                  
                  Text('How was Lawn Mowing Business’s Service?', style: text26, textAlign: TextAlign.center,),
                  Text('Give a thumbs up for good delivery.'),
                  SizedBox(height: 30,),
                  // Rating
                  RatingBar.builder(
                    initialRating: initialRate,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5, 
                    ignoreGestures: !status,
                    itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,), 
                    onRatingUpdate: (double value) { 
                      if (!status) {
                        setState(() {
                          initialRate = value;
                        });
                      }
                     },
                  ),
                  SizedBox(height: 30,),
                  Text('Get Help', style: TextStyle(color: Color(0xFF0F984A), fontSize: 17),),
                  SizedBox(height: 30,),
                  Text('Thanks for Ordering!', style: text26,),
                  Text('Your order total was \$298.03.'),
                ],
              ),
            )
            ),
          if(status! )...[

          ElevatedButton(
              onPressed: status! ? null : (){
                // add rating
                apiProvider.rateService(widget.businessId, userId, widget.serviceId, widget.orderId, initialRate.toString(), 'review').then((value){
                });
                Get.to(()=>RateResponse());
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
      ),
    );
  }
}


class RateResponse extends StatelessWidget {
  const RateResponse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Text('Thanks for using Squeeky, Dolly', style: text34,)
            ),
          Container(
            width: Get.width,
            height: Get.height * 0.4,
            decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: const DecorationImage(
              image: AssetImage('assets/frame11.png'),
              fit: BoxFit.cover,
                ),
              )
          )
        ],
      ),
    );
  }
}