import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/store_info.dart';

import '../controllers/business_controllers.dart';
import '../widgets.dart';

class CustomScreen extends StatefulWidget {
  String query;
  CustomScreen({Key? key, required this.query}) : super(key: key);

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  
  BusinessController businessController = Get.put(BusinessController());
  
  ScrollController _scrollController = ScrollController();
  bool _showSearchIcon = false;
  
  @override
  void initState() {
    super.initState();
    businessController.findABusiness(widget.query);
    // Add a listener to the scroll controller to detect scrolling
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 0) {
        // User is scrolling up, show the search icon
        setState(() {
          _showSearchIcon = true;
        });
      } else {
        // User is at the top, hide the search icon
        setState(() {
          _showSearchIcon = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 100.0,
            floating: false,
            pinned: true,
            // Define your AppBar content here
            flexibleSpace: FlexibleSpaceBar(
              title: _showSearchIcon
                  ? ElevatedButton(
                      onPressed: () {
                        // Handle search button press
                      },
                      child: Icon(Icons.search),
                    )
                  : null,
              background: Image.network(
                'https://picsum.photos/250?image=1',
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Obx(() {
              return SliverList(
                
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    var businessData = businessController.businessSearchResult[index];
                    return BizContainerWidget(
                          businessBanner: 'https://squeeky.org/dashboard/businessfiles/${businessData.imagePath}',
                          businessName: businessData.business_name,
                          bussinessDesc: businessData.businessDesc,
                          businessRating: 4,
                          actionFunction: () =>
                              Get.to(() => StoreInformation(business: businessData,)),
                        );
                  },
                  childCount: businessController.businessSearchResult.length, // Replace with your actual list size
                ),
              );
            }
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
