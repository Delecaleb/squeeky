import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/schedule_booking.dart';
import 'package:squeeky/style/textstyles.dart';

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
        when = picked.day.toString();
        searchBusinessController.when = picked.day.toString();
      });
    }
  }
  
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
        ), 
        preferredSize: Size.fromHeight(70)),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(showSearchService)...[

                Text('What do you need?', style: text26,),
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
                trailing: Text(service, style: text14B,),
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
                    showSearchWhere = false;
                    showSelectProperty = true;
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
                  backgroundColor: Colors.blue
                ),
              ),
              
              ],
              
                
            ],
          ),
        ),
    );
  }
}


class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
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
          initialChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            BizContainerWidget(
                              actionFunction: () => Get.to(()=>ScheduleBooking()),
                              businessBanner: 'https://picsum.photos/250?image=1', 
                              businessName: 'Deep Cleaning Business #1', 
                              bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
                              businessRating: 4.2
                            ),
                            SizedBox(height: 20,),
                            
                            BizContainerWidget(
                              actionFunction: () => Get.to(()=>ScheduleBooking()),
                              businessBanner: 'https://picsum.photos/250?image=1', 
                              businessName: 'Deep Cleaning Business #1', 
                              bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
                              businessRating: 4.2
                            ),
                            BizContainerWidget(
                              actionFunction: () => Get.to(()=>ScheduleBooking()),
                              businessBanner: 'https://picsum.photos/250?image=1', 
                              businessName: 'Deep Cleaning Business #1', 
                              bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
                              businessRating: 4.2
                            ),
                            BizContainerWidget(
                              actionFunction: () => Get.to(()=>ScheduleBooking()),
                              businessBanner: 'https://picsum.photos/250?image=1', 
                              businessName: 'Deep Cleaning Business #1', 
                              bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
                              businessRating: 4.2
                            ),
                          ],
                        ),
                      )),
                  IgnorePointer(
                    child:
                    Container(
                      color: Colors.white,
                      child: Divider(
                        indent: Get.width *0.4,
                        endIndent: Get.width *0.4,
                        thickness: 5,
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