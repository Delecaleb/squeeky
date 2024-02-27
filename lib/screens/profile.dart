import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:squeeky/screens/update_password.dart';
import 'package:squeeky/user_paid_orders_list.dart';
import 'package:squeeky/controllers/update_profile_controller.dart';
import 'package:squeeky/screens/account_wallet.dart';
import 'package:squeeky/screens/favourite_screen.dart';
import 'package:squeeky/screens/home.dart';
import 'package:squeeky/screens/login.dart';
import 'package:squeeky/screens/promotions.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

import '../providers/api_data_provider.dart';

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
              child: Container(
                width: 40,
                height: 40,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(),
                  ),
                child: ClipOval(child: box.read('userPicture') !='' && box.read('userPicture') !=null ? CachedNetworkImage(imageUrl: "https://squeeky.org/api/usersPhoto/${box.read('userPicture')}",) : Image.asset('assets/carrier.png', fit: BoxFit.cover,))
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
                ActionIconWidget(assetImage: 'wallet.png', action: ()=>Get.to(()=>AccountWallet(userId: box.read('userPhone'),)), title: 'Wallet'),
                ActionIconWidget(assetImage: 'orders.png', action: ()=>Get.to(()=>PaidOrders()), title: 'Orders'),
                SizedBox(height: 20,),
                
              ],
            ),
            ListTile(
              leading: Icon(Icons.line_style),
              title: Text('Promotions'),
              subtitle: Text('Coming soon', style: text12L,),
              onTap: ()=>Get.to(()=>Promotions()),
            ),
          const  SizedBox(height: 20,),
          // const  ListTile(
          //     leading: Icon(Icons.control_camera_rounded),
          //     title: Text('Help'),
          //   ),
            // SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.stars),
              title: Text('Services Rewards'),
              subtitle: Text('Coming soon', style: text12L,),
            ),
            // SizedBox(height: 20,),
            // ListTile(
            //   leading: Icon(Icons.cases),
            //   title: Text('Business Preferences'),
            //   subtitle:Text('Make work meals quicker and easier', style: TextStyle(color: Color(0xFF0F984A)),),
            // ),
            SizedBox(height: 20,),
            ListTile(
              onTap: () => Share.share('Im inviting you to sign up on squeeky. Squeeky helps you to access cleaning businesses at the tip of your fingers', subject: 'Squeeky Clean'),
              leading: Icon(Icons.cases),
              title: Text('Invite friends'),
              subtitle:Text('Get \$10 off your order'),
            ),
            SizedBox(height: 20,),
            // ListTile(
            //   leading: Icon(Icons.remove_red_eye_rounded),
            //   title: Text('Privacy'),
            // ),
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),

            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(),
                ),
              child: ClipOval(
                child: box.read('userPicture') !='' && box.read('userPicture') !=null ? 
                CachedNetworkImage(
                  imageUrl: "https://squeeky.org/api/usersPhoto/${box.read('userPicture')}",
                ) 
                  : 
                Image.asset('assets/carrier.png', fit: BoxFit.cover,)
              ),
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

              subtitle: Text(''),
              
            ),
            Container(
              height: 40,
              width: double.maxFinite,
              color: Color(0xFFF7F4F8),
            ),
            InkWell(
              onTap: (){
                /// remove all storage data
                box.erase();                
                /// navigate to login screen
                Get.to(()=>LoginScreen());
              },
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

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final box = GetStorage();

  final apiHandler = ApiDataProvider();

  var pickedImageFile = Rxn<File>();

  RxBool sendingFile = false.obs;

  Future <void> uploadDp(File filePath) async{
    sendingFile(true);
    apiHandler.UploadDpFile(filePath, box.read('userPhone')).then((responseData){
      if(responseData['status']=='done'){
        Get.snackbar('', responseData['message']);
        box.write('userPicture', responseData['img_file']);
        pickedImageFile.value = null;
        Get.to(()=>EditProfile());
      }else{
        Get.snackbar('', responseData['message']);
      }
        sendingFile(false);
    });
  }

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
        pickedImageFile.value = croppedFile != null ? File(croppedFile.path) : null;
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit account'),

        actions: [
          IconButton(onPressed: ()=>Get.offAll(()=>HomeScreen(currentIndex: 4)), icon: Icon(Icons.home))
        ],
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
                  Obx(() {
                      return Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(),
                              ),
                            child: ClipOval(
                              child:  pickedImageFile.value !=null ? 
                              Image.file(pickedImageFile.value!) 
                              
                              : 
                              
                              Container(
                                child: box.read('userPicture') !='' && box.read('userPicture') !=null ? CachedNetworkImage(imageUrl: "https://squeeky.org/api/usersPhoto/${box.read('userPicture')}",) : Image.asset('assets/carrier.png', fit: BoxFit.cover,)
                                )
                                
                              ),
                            ),
                            SizedBox(width: 20,),
                            /// upload dp button UI  
                            pickedImageFile.value !=null ?
                              /// show upload button if file is selected 
                              ElevatedButton(onPressed: ()=>uploadDp(pickedImageFile.value!), 
                              // show progress if button is clicked else show text
                              child: sendingFile.value  ? CircularProgressIndicator() : Text('Update Picture')) 
                              :
                              // show notting if no file selected 
                              const Text('')
                        ],
                      );
                      }),
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(child: Text(box.read('userEmail'), style: titleText,)),
                    SizedBox(width: 15,),
                    Text('unverified'),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios,  size: 17, color: Colors.grey,),
              ),
              ListTile(
                onTap: ()=>Get.to(()=>UpdatePasswordScreen()),
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