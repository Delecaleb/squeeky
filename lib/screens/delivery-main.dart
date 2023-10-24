import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/models/business_category.dart';
import 'package:squeeky/providers/dummy_data_provider.dart';
import 'package:squeeky/screens/custom.dart';
import 'package:squeeky/screens/search_screen.dart';
import 'package:squeeky/screens/services.dart';
import 'package:squeeky/screens/store_info.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';
class Delivery extends StatefulWidget {
  Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  TextEditingController searchController = TextEditingController();
 late Future <List<BusinessCategory>> dummyServicePro;
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    dummyServicePro = DummyDataProvider.getProviders();
    print(dummyServicePro);
    super.initState();
  }
  void _pickDate ()async{
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: selectedDate, 
      firstDate: DateTime.now(), 
      lastDate: DateTime.now().add(Duration(days: 10000))
      );
    if(picked !=null && picked !=selectedDate){
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){}, 
                child: Text('Delivery'),
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: Text('Schedule'),
              )
            ],
          ), 
          Text('Now 200 Lonsdale Rd, Toronto', style: textInfoBold,),
          ],
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
          SizedBox(height: 10,), 
          Container(
                  decoration: BoxDecoration(
                     color: Color(0xFFEFECF0),
                     borderRadius: BorderRadius.circular(40)
                  ),
                  child: ListTile(
                    onTap: ()=>Get.to(()=>SearchScreen()),
                    leading: Icon(Icons.search),
                    title: Text("What job ?"),
                    subtitle: Text('Any job . Any day'),
                  ),
                ), 
          SizedBox(height: 20,),
          GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: Get.width * 0.20
                      ),
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                          color: Color(0xFFF7F4F8),
                          borderRadius: BorderRadius.circular(8)
                        ),
                          child:ListTile(
                        onTap: ()=>Get.to(()=>CustomScreen()),
                        trailing: Image.asset(
                                    'assets/house.png',
                                    fit: BoxFit.cover,
                                    width: (Get.width * 0.2)/3,
                                  ),
                        title: Text('Deep cleaning', style: text17B,),
                        ) 
                        ),

                        
          
                        Container(
                          // padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                          color: Color(0xFFF7F4F8),
                          borderRadius: BorderRadius.circular(8)
                        ),
                          child: ListTile(
                        onTap: ()=>Get.to(()=>ServicesScreen()),
                        trailing: Image.asset(
                                    'assets/car.png',
                                    fit: BoxFit.cover,
                                    width: (Get.width * 0.2)/3,
                                  ),
                        title: Text('Car Detailing', style: text17B,),
                        )
                        ),
          
                        Container(
                          // padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                          color: Color(0xFFF7F4F8),
                          borderRadius: BorderRadius.circular(8)
                        ),
                          child: ListTile(
                        onTap: ()=>Get.to(()=>ServicesScreen()),
                        trailing: Image.asset(
                                    'assets/wash.png',
                                    fit: BoxFit.cover,
                                    width: (Get.width * 0.2)/3,
                                  ),
                        title: Text('Pressure Washing', style: text17B,),
                        )
                        ),
                        

                        ListTile(
                          onTap: ()=>Get.to(()=>ServicesScreen()),
                          
                          title: Text('Find Services', style: text17B,),
                        )
          
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 5,
                    ),
                    SizedBox(height: 10,),
          
          Container(
            height: 500,
            color: Colors.white,
            child: 
            
            FutureBuilder<List<BusinessCategory>>(
              future: dummyServicePro,
              builder: (context, snapshot){
                print(snapshot.error);
                if(snapshot.hasData){
          
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, int){
                    BusinessCategory serviceProvider = snapshot.data![int];
                    return BizContainerWidget(
                            businessBanner: 'https://picsum.photos/250?image=1', 
                            businessName: serviceProvider.storeName, 
                            bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
                            businessRating: 4.2, 
                            actionFunction: () =>null,
                          );
                  }
                  );
                }else{
                  return Container();
                }
              }
              ),
          
          )
        ]),
      ),
    );
  }
}
