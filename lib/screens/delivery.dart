import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/models/service_provider.dart';
import 'package:squeeky/providers/dummy_data_provider.dart';
import 'package:squeeky/screens/search_screen.dart';
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
 late Future <List<ServiceProvidersModel>> dummyServicePro;
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
      body: Container(
        height: Get.height,
        width: Get.width,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Card(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://picsum.photos/250?image=1',
                                    fit: BoxFit.cover,
                                    width: (Get.width * 0.2)/2,
                                  ),
                                ),
                              ),
                              Text('Pressure Washing'),
                            ],
                          ),
                        ),
          
                        GestureDetector(
                          onTap: ()=>_pickDate(),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: Color(0xFFF7F4F8),
                            borderRadius: BorderRadius.circular(8)
                          ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://picsum.photos/250?image=1',
                                      fit: BoxFit.cover,
                                      width: (Get.width * 0.2)/2,
                                    ),
                                  ),
                                ),
                                Text('Pressure Washing'),
                              ],
                            ),
                          ),
                        ),
          
                        GestureDetector(
                          onTap: ()=>_pickDate(),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: Color(0xFFF7F4F8),
                            borderRadius: BorderRadius.circular(8)
                          ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://picsum.photos/250?image=1',
                                      fit: BoxFit.cover,
                                      width: (Get.width * 0.2)/2,
                                    ),
                                  ),
                                ),
                                Text('Pressure Washing'),
                              ],
                            ),
                          ),
                        ),
          
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 5,
                    ),
                    SizedBox(height: 10,),
          
          Expanded(
            child: SingleChildScrollView(
              child: 
              Container(
                height: 500,
                color: Colors.white,
                child: 
                
                FutureBuilder<List<ServiceProvidersModel>>(
                  future: dummyServicePro,
                  builder: (context, snapshot){
                    print(snapshot.error);
                    if(snapshot.hasData){
              
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, int){
                        ServiceProvidersModel serviceProvider = snapshot.data![int];
                        return BizContainerWidget(
                                businessBanner: 'https://picsum.photos/250?image=1', 
                                businessName: serviceProvider.storeName, 
                                bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
                                businessRating: 4.2, 
                                actionFunction: () => Get.to(()=>StoreInformation()),
                              );
                      }
                      );
                    }else{
                      return Container();
                    }
                  }
                  ),
              
              ),
              // Column(
              //   children: [
                    
              //     BizContainerWidget(
              //       businessBanner: 'https://picsum.photos/250?image=1', 
              //       businessName: 'Deep Cleaning Business #1', 
              //       bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
              //       businessRating: 4.2, 
              //       actionFunction: () => Get.to(()=>StoreInformation()),
              //     ),
              //     SizedBox(height: 20,),
              //     BizContainerWidget(
              //       actionFunction: () => Get.to(()=>StoreInformation()),
              //       businessBanner: 'https://picsum.photos/250?image=1', 
              //       businessName: 'Deep Cleaning Business #1', 
              //       bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
              //       businessRating: 4.2),
              //     SizedBox(height: 20,),
              //     BizContainerWidget(
              //       actionFunction: () => Get.to(()=>StoreInformation()),
              //       businessBanner: 'https://picsum.photos/250?image=1', 
              //       businessName: 'Deep Cleaning Business #1', 
              //       bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
              //       businessRating: 4.2),
              //     SizedBox(height: 20,),
              //     BizContainerWidget(
              //       actionFunction: () => Get.to(()=>StoreInformation()),
              //       businessBanner: 'https://picsum.photos/250?image=1', 
              //       businessName: 'Deep Cleaning Business #1', 
              //       bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
              //       businessRating: 4.2),
              //     SizedBox(height: 20,),
              //     BizContainerWidget(
              //       actionFunction: () => Get.to(()=>StoreInformation()),
              //       businessBanner: 'https://picsum.photos/250?image=1', 
              //       businessName: 'Deep Cleaning Business #1', 
              //       bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
              //       businessRating: 4.2),
              //     SizedBox(height: 20,),
              //     BizContainerWidget(
              //       actionFunction: () => Get.to(()=>StoreInformation()),
              //       businessBanner: 'https://picsum.photos/250?image=1', 
              //       businessName: 'Deep Cleaning Business #1', 
              //       bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
              //       businessRating: 4.2
              //       ),
              //     SizedBox(height: 20,),
              //     BizContainerWidget(
              //       actionFunction: () => Get.to(()=>StoreInformation()),
              //       businessBanner: 'https://picsum.photos/250?image=1', 
              //       businessName: 'Deep Cleaning Business #1', 
              //       bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
              //       businessRating: 4.2
              //     ),
                
              //   ],
              // ),
            
            ),
          )
        ]),
      ),
    );
  }
}
