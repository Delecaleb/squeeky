import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squeeky/completed_orders_list.dart';
import 'package:squeeky/screens/account_wallet.dart';
import 'package:squeeky/screens/favourite_screen.dart';
import 'package:squeeky/screens/promotions.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dolly Sheep"),

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
  const ViewProfile({super.key});

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
            Text('Dolly', style: text18,),
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
  const EditProfile({super.key});

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
                      child: Image.asset('assets/carrier.png', fit: BoxFit.cover,),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    child: CircleAvatar(
                      radius: 15,
                      child: IconButton(icon: Icon(Icons.edit, color: Colors.white, size: 15,), onPressed: null,),
                      backgroundColor: Colors.black,
                      )
                  )
                ],
              ),
              
              ListTile(
                onTap: ()=>Get.to(()=>EditProfileScreen(item: 'First name', itemValue: 'Dolly')),
                contentPadding: EdgeInsets.zero,
                title: Text('First name'),
                subtitle: Text('Dolly', style: titleText,),
                trailing: Icon(Icons.arrow_forward_ios,  size: 17, color: Colors.grey,),
              ),
              
              ListTile(
                onTap: ()=>Get.to(()=>EditProfileScreen(item: 'Last name', itemValue: 'Sheep')),
                contentPadding: EdgeInsets.zero,
                title: Text('Last name'),
                subtitle: Text('Sheep', style: titleText,),
                trailing: Icon(Icons.arrow_forward_ios, size: 17, color: Colors.grey,),
              ),
              
              ListTile(
                onTap: ()=>Get.to(()=>EditProfileScreen(item: 'Phone number', itemValue: '+234 9087675456')),
                contentPadding: EdgeInsets.zero,
                title: Text('Phone number'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('+234 9087675456', style: titleText,),
                    Text('Verified'),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios ,  size: 17, color: Colors.grey,),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Email address'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('dolly@gmail.com', style: titleText,),
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
          ],
        ),
      ),
    );
  }
}