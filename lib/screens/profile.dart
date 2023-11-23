import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:squeeky/completed_orders_list.dart';
import 'package:squeeky/controllers/update_profile_controller.dart';
import 'package:squeeky/screens/account_wallet.dart';
import 'package:squeeky/screens/favourite_screen.dart';
import 'package:squeeky/screens/promotions.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class Profile extends StatelessWidget {
   Profile({super.key});
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${box.read('userFirstName') } ${box.read('userLastName')}"),

            InkWell(
              onTap: ()=>Get.to(()=>ViewProfile()),
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionIconWidget(assetImage: 'favorite.png', action: (){Get.to(()=>FavouriteScreen());}, title: 'Favourites'),
                ActionIconWidget(assetImage: 'wallet.png', action: ()=>Get.to(()=>AccountWallet()), title: 'Wallet'),
                ActionIconWidget(assetImage: 'orders.png', action: ()=>Get.to(()=>CompletedOrders()), title: 'Orders'),
                SizedBox(height: 20,),
                
              ],
            ),
            ListTile(
              leading: Icon(Icons.line_style),
              title: Text('Promotions'),
              onTap: ()=>Get.to(()=>Promotions()),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.control_camera_rounded),
              title: Text('Help'),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.stars),
              title: Text('Services Rewards'),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.cases),
              title: Text('Business Preferences'),
              subtitle:Text('Make work meals quicker and easier', style: TextStyle(color: Color(0xFF0F984A)),),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.cases),
              title: Text('Invite friends'),
              subtitle:Text('Get \$10 off your order'),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.remove_red_eye_rounded),
              title: Text('Privacy'),
            ),
          ],
        ),
      ),
    );
  }
}


class ViewProfile extends StatelessWidget {
  ViewProfile({super.key});
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 60,),
            ),
            SizedBox(height: 10,),
            Text(box.read('userFirstName'), style: text18,),
            TextButton(
              child: Text('Edit account'),
              onPressed: () => Get.to(()=>EditProfile()),            
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Color(0xFFF7F4F8),
              width: double.maxFinite,
              child: Text('SAVED PLACES', style: text14,)
              ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.home),

              title: Text('Home'),

              subtitle: Text('200 Lonsdale Rd, Toronto, ON M4V 1W6'),
              
            ),
            Container(
              height: 40,
              width: double.maxFinite,
              color: Color(0xFFF7F4F8),
            ),
            InkWell(
              onTap: null,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                width: double.maxFinite,
                child: Text('Sign out')),
            )
          ],
        ),
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final box = GetStorage();
  var pickedImageFile = Rxn<File>();
  void changeProofilePics()async{
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(_image == null) return ;
    final _imagePath = File(_image.path);

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: _imagePath.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
    uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Squeeky Cropper',
            toolbarColor: Color(0xFF87CEEB),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
    ]
    );
        pickedImageFile.value = (croppedFile != null ? File(croppedFile.path) : null)!;
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit account'),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    // color: Colors.amber,
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(border: Border.all()),
                    child: ClipOval(
                      child: Obx(() {
                          return pickedImageFile.value !=null ? Image.file(pickedImageFile.value!) : Image.asset('assets/carrier.png', fit: BoxFit.cover,);
                        }
                      ),
                    ),
                  ),
                   Positioned(
                    bottom: 2,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black,
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white, size: 15,), 
                        onPressed: ()=>changeProofilePics(),),
                      )
                  )
                ],
              ),
              
              ListTile(
                onTap: ()=>Get.to(()=>EditProfileScreen(item: 'First name', itemValue: box.read('userFirstName'))),
                contentPadding: EdgeInsets.zero,
                title: Text('First Name'),
                subtitle: Text(box.read('userFirstName'), style: titleText,),
                trailing: Icon(Icons.arrow_forward_ios,  size: 17, color: Colors.grey,),
              ),
              
              ListTile(
                onTap: ()=>Get.to(()=>EditProfileScreen(item: 'Last name', itemValue: box.read('userLastName'))),
                contentPadding: EdgeInsets.zero,
                title: Text('Last name'),
                subtitle: Text(box.read('userLastName'), style: titleText,),
                trailing: Icon(Icons.arrow_forward_ios, size: 17, color: Colors.grey,),
              ),
              
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Phone number'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(box.read('userPhone'), style: titleText,),
                    Text('Verified'),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios ,  size: 17, color: Colors.grey,),
              ),
              ListTile(
                onTap: ()=>Get.to(()=>EditProfileScreen(item: 'Email address', itemValue: box.read('userEmail'))),
                contentPadding: EdgeInsets.zero,
                title: Text('Email Address'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(box.read('userEmail'), style: titleText,),
                    Text('unverified'),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios,  size: 17, color: Colors.grey,),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Password'),
                subtitle: Text('********', style: titleText,),
                trailing: Icon(Icons.arrow_forward_ios,  size: 17, color: Colors.grey,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class EditProfileScreen extends StatefulWidget {
  String item, itemValue;
  EditProfileScreen({ required this.item, required this.itemValue,  Key? key}) : super(key: key);
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final updateController  = Get.put(UpdateUserAccountController());
  late TextEditingController valueController ;
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
    valueController  = TextEditingController(text: widget.itemValue);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.item, style: text15L,),
            SizedBox(height: 10,),
            TextField(
                    
                    controller: valueController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Color(0xFFEFECF0),
                      fillColor: Color(0xFFEFECF0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,)
                      ),
                      filled: true,
                    ),
                  ),
            SizedBox(height:30),
            TextButton(
              onPressed: (){
                updateController.updateProfile(widget.item, valueController.text, box.read('userPhone') );
              }, 
              child: Text("Update ${widget.item}", style: textBtn,),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF87CEEB),
                minimumSize: Size.fromHeight(50), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}