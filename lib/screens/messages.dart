import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/style/textstyles.dart';

class InboxMessagesScreen extends StatefulWidget {
  InboxMessagesScreen({Key? key}) : super(key: key);

  @override
  State<InboxMessagesScreen> createState() => _InboxMessagesScreenState();
}

class _InboxMessagesScreenState extends State<InboxMessagesScreen> with SingleTickerProviderStateMixin {
 late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
        bottom: TabBar(
          padding: EdgeInsets.zero,
          controller: tabController, // Use the TabController here
          tabs: [
            Text("Messages"), Text("Notifications")
            ],
          labelPadding: EdgeInsets.zero,
        ),
      ),
      body: TabBarView(
        controller: tabController, // Use the TabController here
        children: [
          MessagesTab(),
          NotificationsTab(),
        ],
      ),
    );
  }
}

class MessagesTab extends StatelessWidget {
  const MessagesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ListTile(
            onTap: () => Get.to(()=>NewMessageScreen()),
            leading: CircleAvatar(
              backgroundColor: Color(0xFFD9D9D9),
            ),
            title: Row(
              children: [
                ///for user name
                Text("Betty", style: text14B,),
                /// for user country
                Text(" .Manchester",style: text14,),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New date and time request", style: text14B,),
                Text("Canceled Feb 13 - 14, 2023"),
              ],
            )
          ),
          Divider(),
        ],
      ),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


class NewMessageScreen extends StatefulWidget {
  const NewMessageScreen({Key? key}) : super(key: key);

  @override
  State<NewMessageScreen> createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mark"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(),
                title: Text("Power washing biz"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Booked. 19 Jan"),
                    Row(
                      children: [
                        TextButton.icon(onPressed: null, icon: Icon(Icons.door_front_door_outlined), label: Text("Business"),),
                        TextButton.icon(onPressed: null, icon: Icon(Icons.share), label: Text("Share"),),
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 15,),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(),
                      title: Row(
                        children: [
                          Text("Mark", style: text16,),
                          Text("3:58 PM", )
                        ],
                      ),
                      subtitle: Text("Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us!"),
                    ),
                            
                  ],
                )
                ),
              Container(
                child: Row(
                  children: [
                    Expanded(child: TextField()),
                    IconButton(onPressed: null, icon: Icon(Icons.send))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}