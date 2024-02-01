import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/schedule_booking.dart';
import 'package:squeeky/style/textstyles.dart';

import '../controllers/cart_contrroller.dart';
import '../controllers/search_business_controller.dart';
import '../widgets.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool showSearchService = true;
  bool showSearchWhere = false;
  bool showSearchWhen = false;
  bool showWhen = false;
  bool showSelectProperty = false;
  String service ='';
  String location = '';
  SearchBusinessController searchBusinessController = Get.put(SearchBusinessController());
  CartController cartController = Get.put(CartController());

  String when = 'Any Day';
  
  void _pickDate ()async{
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.now(), 
      lastDate: DateTime.now().add(Duration(days: 100))
      );
    if(picked !=null){
      setState(() {
        cartController.bookingDate= picked.toString();
        when = picked.toString();
        searchBusinessController.when = picked.toString();
      });
    }
  }
  
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: null, 
                child: Text('Delivery'),
              ),
              ElevatedButton(
                onPressed: null, 
                child: Text('Schedule'),
              )
            ],
        )),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(showSearchService)...[

                Padding(
                  padding: const EdgeInsets.symmetric(vertical:10.0),
                  child: Text('What do you need?', style: text26,),
                ),
                TextField(
                  controller: searchBusinessController.service,
                  autofocus: true,
                  onEditingComplete: (){
                    setState(() {
                      service = searchController.text;
                      showSearchService = false;
                      showSearchWhere =true;
                    });
                  },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 24,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ), 
                ),
              
              ],
              if(!showSearchService)...[
                ListTile(
                leading: Text("What", style: text14,),
                trailing: Text( searchBusinessController.service.text, style: text14B,),
              )
              ],
              ListTile(
                leading: Text("Where", style: text14,),
                trailing: Text(location, style: text14B,),
              ),
              if(showSearchWhere)...[
                  
                  SizedBox(height: 20,),
                  TextField(
                    controller: searchBusinessController.where,
                    onEditingComplete:(){
                      setState(() {
                        location = searchBusinessController.where.text;
                        showSearchWhere = false;
                        showSelectProperty = true;
                      });
                      _pickDate() ;
                  },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Search location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  
                ),
              ),
              SizedBox(height: 20,),
              ListTile(
                onTap: () {
                  setState(() {
                    location = 'Home';
                    
                    searchBusinessController.where.text = 'Home' ;
                    showSearchWhere = false;
                    showSelectProperty = true;
                  });
                 _pickDate() ;

                },
                leading: Icon(Icons.location_on),
                title: Text('Home'),
              ),
              SizedBox(height: 20,),
              ],
              
              ListTile(
                leading: Text('When', style: text14,),
                trailing: Text(when, style: text14B,),
                ),
              if(showSelectProperty)...[
                SizedBox(height: 20,),
                TextButton(
                onPressed: (){
                  searchBusinessController.searchBusiness();
                  Get.to(()=>SearchResult());
                }, 
                child: Text('Next', style: textBtn,),
                style: TextButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Color(0xFF87CEEB),
                  shape: LinearBorder()                  
                ),
              ),
              
              ],
              
                
            ],
          ),
        ),
    );
  }
}


class SearchResult extends StatelessWidget {
  SearchResult({super.key});
  SearchBusinessController businessResult = Get.put(SearchBusinessController());
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: TextField(
                 decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.edit_attributes_outlined)
                 ), 
                ), 
          preferredSize: Size.fromHeight(60)
          ),
        body: 
      DraggableScrollableSheet(
          minChildSize: 0.8,
          maxChildSize: 1,
          initialChildSize: 0.95,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              // height: MediaQuery.of(context).size.height * 0.9,
              // width: MediaQuery.of(context).size.width,
              // color: Colors.white,
              child: Stack(
                children: [
                  Obx(
                () {
          if (businessResult.searchResult.isEmpty) {
            return Center(
              child: ShimmerLoader(),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              itemCount: businessResult.searchResult.length,
              itemBuilder: (context, index) {
                final businessData = businessResult.searchResult[index];
                return BizContainerWidget(
                              actionFunction: ()async{
                                 cartController.businessId = businessData.businessId;
                                 Get.to(()=>ScheduleBooking(businessDetails: businessData,));
                                 },
                              businessBanner: 'https://squeeky.org/dashboard/businessfiles/${businessData.imagePath}', 
                              businessName: businessData.business_name, 
                              bussinessDesc: businessData.businessDesc, 
                              businessRating: 4.2
                            );
              },
            );
          }
                },
              ),                  
                  IgnorePointer(
                    child:
                    Container(
                      color: Colors.white,
                      child: Divider(
                        indent: Get.width *0.42,
                        endIndent: Get.width *0.42,
                        thickness: 4,
                      ),
                    ) 
                    
                  ),
                ],
              ),
            );
          },
        ),
      
      ),
    );
  }
}