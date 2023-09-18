import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/style/textstyles.dart';

class InputWidget extends StatelessWidget {
  
  String label;
  Icon inputIcon;
  late TextEditingController input_controller;
  InputWidget({super.key, required this.label, required this.input_controller, required this.inputIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(bottom: 15),
      child: TextField(
        scrollPadding: EdgeInsets.only(bottom: 30),
        controller: input_controller,
        decoration: InputDecoration(
        prefixIcon: inputIcon,
        prefixIconColor: Colors.green,
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 1.5)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.5,
          )
        )
    
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
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 1.5)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.5,
          )
        )
    
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