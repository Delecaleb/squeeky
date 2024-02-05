import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:squeeky/screens/custom.dart';
import 'package:squeeky/screens/orders_list.dart';
import 'package:squeeky/style/textstyles.dart';

class InputWidget extends StatelessWidget {
  bool obscureText;
  String label;
  Icon inputIcon;
  late TextEditingController input_controller;
  InputWidget({super.key, required this.label, required this.input_controller, required this.inputIcon, required this.obscureText });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: obscureText,
        scrollPadding: EdgeInsets.only(bottom: 30),
        controller: input_controller,
        decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: inputIcon,
        prefixIconColor: Color(0xFF87CEEB),
        labelText: label,
       focusColor: Color(0xFFEFECF0),
       fillColor: Color(0xFFEFECF0),
       filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF87CEEB), width: 1.5)
        ),
        
    
        ),
      ),
    );
  }
}


class BasicInputWidget extends StatelessWidget {
  
  String label;
  late TextEditingController input_controller;
  BasicInputWidget({super.key, required this.label, required this.input_controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(bottom: 15),
      child: TextField(
        
        scrollPadding: EdgeInsets.only(bottom: 30),
        controller: input_controller,
        decoration: InputDecoration(
        labelText: label,
        focusColor: Color(0xFFEFECF0),
        fillColor: Color(0xFFEFECF0),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEFECF0), width: 1.5)
        ),
        enabledBorder: InputBorder.none,
    
        ),
      ),
    );
  }
}


// class RoundedCardWidget extends StatelessWidget {
//   Widget child;
//   RoundedCardWidget({required this.child, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.grey,
//           width: 2,
//         )
//       ),
//       child: child,
//     );
//   }
// }

class BizContainerWidget extends StatelessWidget {
  String businessBanner, businessName, bussinessDesc;
  final Function actionFunction;
  double businessRating; 
  BizContainerWidget({ required this.businessBanner, required this.businessName, required this.bussinessDesc, required this.businessRating, required this.actionFunction, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>actionFunction(),
      child: Column(
        children: [
          Stack(
                    children: [
                      Container(
                        height: Get.height * 0.2,
                        width: Get.width,
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 188, 188, 188),
                          image: DecorationImage(image: 
                          NetworkImage(businessBanner,
                          ),
                          fit: BoxFit.cover,
                          
                          )
                        ),                      
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Icon(Icons.favorite_border_outlined, color: Colors.white,),
                        )
                    ],
                  ),
                  ListTile(
                    
                    contentPadding: EdgeInsets.zero,
                    title: Text(businessName, style: text17B,),
                    subtitle: Text(bussinessDesc, style: text15L,
                      maxLines: 1,  
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Color(0xFFEFECF0),
                      child: Text(businessRating.toString()),
                    ),
                  )
        ],
      ),
    );
  }
}

class ActionIconWidget extends StatelessWidget {
  String assetImage, title; Function action;
  ActionIconWidget({ required this.assetImage, required this.action, required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action(),
      child: Container(
        width: Get.width * 0.27,
        padding: EdgeInsets.symmetric(horizontal:2, vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xFFF7F4F8),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(children: [
          Image.asset('assets/$assetImage'),
          Text('$title', style: titleText,)
        ]),
      ),
      
    );
  }
}

class PropertyTypeWidget extends StatelessWidget {
  String image, type;
  PropertyTypeWidget({required this.image, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                  color: Color(0xFFF7F4F8),
                  borderRadius: BorderRadius.circular(8)
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            width: (Get.width * 0.2)/2,
                          ),
                        ),
                      ),
                      Text(type),
                    ],
                  ),
                );
  }
}


class RadioTileWidget extends StatefulWidget {
  String groupValue; String radioValue;
  RadioTileWidget({required this.groupValue, required this.radioValue, super.key});
  @override
  State<RadioTileWidget> createState() => _RadioTileWidgetState();
}

class _RadioTileWidgetState extends State<RadioTileWidget> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(widget.radioValue,),
      value: widget.radioValue, 
      groupValue: widget.groupValue, 
      onChanged: (value){
            setState(() {
              widget.groupValue = value!;
            });
          }
      );
  }
}

class FavouritesWidget extends StatelessWidget {
  String title, imageLink, subTitle, subSubTitle;
  FavouritesWidget({required this.imageLink, required this.title, required this.subSubTitle, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
                    height: Get.width * 0.2,
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageLink),
                        fit: BoxFit.cover
                        )
                    ),
                    ),
            Positioned(
              top: 0,
              right: 0,
              child: Icon(Icons.favorite_border_rounded, color: Colors.white,)
              )
          ],
        ),
        Expanded(
          child: ListTile(
              minVerticalPadding: 0,
              minLeadingWidth: Get.width * 0.15,
              title: Text(title, style: text17B,),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subSubTitle),
                  Text(subSubTitle)
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: Color(0xFFF7F4F8),
                child: Text('4.0'),
              ),
          ),
        ),
      ],
    );
  }
}


class ShowMoreLessWidget extends StatefulWidget {
  final String fullText;
  final int maxLines;
  final bool initiallyExpanded;

  ShowMoreLessWidget({
    required this.fullText,
    this.maxLines = 1,
    this.initiallyExpanded = false,
  });

  @override
  _ShowMoreLessWidgetState createState() => _ShowMoreLessWidgetState();
}

class _ShowMoreLessWidgetState extends State<ShowMoreLessWidget> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isExpanded ? Text( widget.fullText ): GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = true;
            });
          },
          child: Text(
           "Show More",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
           "Show Less" ,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class HomeScreenActionBtnWidget extends StatelessWidget {
  String image, title, query; 
  
  HomeScreenActionBtnWidget({ required this.image, required this.title, required this.query, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F4F8),
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    onTap: () => Get.to(() => CustomScreen(query: query,)),
                    trailing: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: (Get.width * 0.2) / 3,
                    ),
                    title: Text(
                      title,
                      style: text17B,
                    ),
                  )
        );
  }
}

class ShimmerLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 234, 233, 233)!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            Container(
                  width: Get.width,
                  height: 130.0,
                  color: Colors.white,
                ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width *0.7,
                  height: 60.0,
                  color: Colors.white,
                ),
                CircleAvatar(),
              ],
            ),
            SizedBox(height: 20,),
            Container(
                  width: Get.width,
                  height: 130.0,
                  color: Colors.white,
                ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width *0.5,
                  height: 60.0,
                  color: Colors.white,
                ),
                CircleAvatar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PillBtn extends StatelessWidget {
  String title, subtitle;

  PillBtn({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:15, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(),
      ),
      child: Column(children: [
        Text(title),
        Text(subtitle)
      ]),
    );
  }
}

class EmptyBasket extends StatelessWidget {
  const EmptyBasket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [            
                        
                Text('Basket', style:  titleText,),
                
                SizedBox(height: 20,),
        
                Image.asset('assets/cart.png', width: Get.width * 0.3),
                SizedBox(height: 40,),
                Text("Add items to start a cart", style: titleText,),
                SizedBox(height: 10,),
                Text("When you select items from a service or store, your cart will be displayed here" , style: textInfoLG, textAlign: TextAlign.center,),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Start Shopping', style: textBtn,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF87CEEB)
                  ),
                )
              ],
            );
  }
}

class ComingSoonBoxes extends StatelessWidget {
  Color colorCode;
   ComingSoonBoxes({Key? key, required this.colorCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 225, 224, 224)
                    )
                  ),
                   child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,
                      title:Container(
                        color: colorCode,
                      height: 100,
                    ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Coming Soon!', style: text17L, textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                 )
            ;
  }
}