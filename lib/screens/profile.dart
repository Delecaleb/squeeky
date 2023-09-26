import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              child: CircleAvatar(),
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
                ActionIconWidget(assetImage: 'orders.png', action: (){}, title: 'Orders'),
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
              subtitle:Text('Make work meals quicker and easier'),
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
            CircleAvatar(),
            Text('Dolly'),
            TextButton(
              child: Text('Edit account'),
              onPressed: () => Get.to(()=>EditProfile()),            
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Color(0xFFF7F4F8),
              width: double.maxFinite,
              child: Text('SAVED PLACES')
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
        child: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              CircleAvatar(),
              
              ListTile(
                title: Text('First name'),
                subtitle: Text('Dolly', style: titleText,),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              
              ListTile(
                title: Text('Last name'),
                subtitle: Text('Sheep', style: titleText,),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              
              ListTile(
                title: Text('Phone number'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('+234 9087675456', style: titleText,),
                    Text('Verified'),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('Email address'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('dolly@gmail.com', style: titleText,),
                    Text('unverified'),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('Password'),
                subtitle: Text('********', style: titleText,),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}