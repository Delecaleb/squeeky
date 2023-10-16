import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                          image: DecorationImage(image: NetworkImage(businessBanner),
                          fit: BoxFit.cover
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
                    title: Text(businessName),
                    subtitle: Text(bussinessDesc),
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
