import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/screens/schedule_booking.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:intl/intl.dart';
import '../controllers/cart_contrroller.dart';
import '../controllers/search_business_controller.dart';
import '../widgets.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final box = GetStorage();
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
        DateTime rawDate = DateTime.parse(picked.toString());
    
       var fmDate = DateFormat('d MMM').format(rawDate);
        searchBusinessController.when = picked.toString();
        when = fmDate;
      });
    }
  }
  
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        title: Obx(() {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: ()=>Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: searchBusinessController.schedule.value ? Colors.white : Colors.black ,
                      ),
                      child: Text('Delivery', style:  searchBusinessController.schedule.value? text15B : text15white,),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        searchBusinessController.schedule(true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: searchBusinessController.schedule.value ? Colors.black : Colors.white,
                      ),
                      child: Text('Schedule', style: searchBusinessController.schedule.value? text15white : text15B,),
                    )
                  ],
                ),
                
              ],
            );
          }
        ),
      ),
      
      
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                child: Text(
                    '${box.read('userPostalCode')} ${box.read('userPostalCode')}',
                    style: textInfoBold, textAlign: TextAlign.center,
                  ),
              ),
                // SizedBox(height: 10,),

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
    DateTime inputDate = DateTime.parse(businessResult.when);
    
    var formattedDate = DateFormat('d MMM').format(inputDate);
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2), 
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListTile(
            onTap: ()=>Get.off(()=>SearchScreen()),
            title: Text(businessResult.service.text, style: text14B,),
            subtitle: Text("${formattedDate}. ${businessResult.where.text}", style: text12L,),
            leading: Icon(Icons.search),
            trailing: Icon(Icons.edit_attributes_outlined),
            ),
        ), 
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
        if (businessResult.isloading.value) {
          return Center(
            child: ShimmerLoader(),
          );
        }else if(businessResult.searchResult.length==0){
          return Container(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:50.0, horizontal: 20),
              child: Text('0 results for “${businessResult.service.text}”', style: text17LA,),
            ),
          );
        }
        else {
          var totalItem = businessResult.searchResult.length;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            itemCount: businessResult.searchResult.length+1,
            itemBuilder: (context, index) {
              if(index==0){
                return Container(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Text('${totalItem} results for “${businessResult.service.text}”', style: text17LA,),
                  ),
                );
              }else{

              final businessData = businessResult.searchResult[index-1];
              return BizContainerWidget(
                            actionFunction: ()async{
                               cartController.businessId = businessData.businessId;
                               Get.to(()=>ScheduleBooking(businessDetails: businessData,));
                               },
                            businessBanner: 'https://squeeky.org/dashboard/businessfiles/${businessData.imagePath}', 
                            businessName: businessData.business_name, 
                            bussinessDesc: businessData.businessDesc, 
                            businessRating: double.parse(businessData.businessRating),
                          );
                }
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
    
    );
  }
}