import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/schedule_booking.dart';
import 'package:squeeky/style/textstyles.dart';

import '../widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

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
                  controller: searchController,
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
                leading: Text("What"),
                trailing: Text(service),
              )
              ],
              ListTile(
                leading: Text("Where"),
                trailing: Text(location),
              ),
              if(showSearchWhere)...[
                  
                  SizedBox(height: 20,),
                  TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Search location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
              SizedBox(height: 20,),
              ListTile(
                onTap: () {
                  setState(() {
                    location = 'Home';
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
                leading: Text('When'),
                trailing: Text(when),
                ),
              // ListTile(
              //   leading: Text('Property Type'),
              //   trailing: Text('Any Type'),
              // ),
              if(showSelectProperty)...[
              //     GridView(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   mainAxisSpacing: 25,
              //   crossAxisSpacing: 25,
              //   mainAxisExtent: Get.width * 0.20
              // ),
              // shrinkWrap: true,
              // children: [
              //   PropertyTypeWidget(image: 'https://picsum.photos/250?image=1', type: 'House'),
              //   PropertyTypeWidget(image: 'https://picsum.photos/250?image=1', type: 'Apartment'),
              //   PropertyTypeWidget(image: 'https://picsum.photos/250?image=1', type: 'Guesthouse'),
              //   PropertyTypeWidget(image: 'https://picsum.photos/250?image=1', type: 'School'),
                
              // ],
              //   ),
                SizedBox(height: 20,),
                TextButton(
                onPressed: ()=>Get.to(()=>SearchResult()), 
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
    return  Scaffold(
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
        minChildSize: 0.1,
        maxChildSize: 0.9,
        initialChildSize: 0.3,
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
    
    );
  }
}