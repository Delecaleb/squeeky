import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:squeeky/style/textstyles.dart';

class RatingServicesScreen extends StatefulWidget {
  const RatingServicesScreen({Key? key}) : super(key: key);

  @override
  State<RatingServicesScreen> createState() => _RatingServicesScreenState();
}

class _RatingServicesScreenState extends State<RatingServicesScreen> {
  double initialRate = 0;
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: NetworkImage('https://picsum.photos/250?image=1'),
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
                    itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,), 
                    onRatingUpdate: (double value) { 
                      setState(() {
                        initialRate = value;
                      });
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
          ElevatedButton(
              onPressed: ()=>Get.to(()=>RateResponse()),
              child: Text('Submit', style: btnBoldLight,),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
                backgroundColor: const Color(0xFF000000),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
              ),
            )
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