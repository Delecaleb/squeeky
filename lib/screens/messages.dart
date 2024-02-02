import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/fetch_notification_controller.dart';
import 'package:squeeky/controllers/messages_contact_controller.dart';
import 'package:squeeky/screens/chat_screen.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';
import '../models/notification_model.dart';

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
        title: Text("Inbox", style:text30),
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
  
  MessagesTab({Key? key}) : super(key: key);

  MessagesContactController messageContacts = Get.put(MessagesContactController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() {
          if(messageContacts.isLoading.value){
            return ShimmerLoader();
          }else {
            return messageContacts.contactsList.isEmpty ? 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Get.height *0.2,),
              // Image.asset("assets/msg.png", width: Get.width *0.5,),
              Text("You have no unread messages", style: text18,),
              Text("When you contact a host or send a reservation request, you’ll see your messages here", style: text16)
            ],
          )
          : 
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: messageContacts.contactsList.length,
            itemBuilder: (context, index){
              
              var contacts = messageContacts.contactsList[index];
      
              return  ListTile(
                onTap: () => Get.to(()=>NewMessageScreen(businessId: contacts.businessId, userId: messageContacts.userId,)),
                leading: CircleAvatar(
                  backgroundImage: contacts.businessLogo !='' &&  contacts.businessLogo.isNotEmpty ? NetworkImage('https://squeeky.org/dashboard/businessfiles/${contacts.businessLogo}') : null,
                  backgroundColor: const Color(0xFFD9D9D9),
                ),
                title: Row(
                  children: [
                     ///for user name
                    Text("${contacts.businessName}", style: text14L,),
                    /// for user country
                    // Text(" ${contacts.businessCity}",style: text14,),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New date and time request", style: text14B,),
                    Text("${contacts.serviceStatus} Feb 13 - 14, 2023"),
                  ],
                )
              );
              
            }
          
          );
          }
        }
      )
      
    );
  }
}

class NotificationsTab extends StatelessWidget {
  
  NotificationsTab({Key? key}) : super(key: key);
  FetchNotificationController fetchNotificationController = Get.put(FetchNotificationController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Obx(() {
          return fetchNotificationController.notificationData.isEmpty ?
            Center(
              child: Text("You’re all caught up"),
            )
            :
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: fetchNotificationController.notificationData.length,
              itemBuilder: (context, index){
                var notifications = fetchNotificationController.notificationData[index];
                return ListTile(
                  onTap: ()=>Get.to(()=>NotificationDetailsScreen(notificationItem: notifications)),
                  leading: CircleAvatar(),
                  title: Text(notifications.details, maxLines: 2, overflow: TextOverflow.ellipsis, style: text15B,),
                  subtitle: Text(notifications.date, style: text12L,),
                );
              }
            ); 
        }
      ),
    );
  }
}


// class NewMessageScreen extends StatefulWidget {
  
//   String userId, businessId;
  
//   NewMessageScreen({Key? key, required this.businessId, required this.userId}) : super(key: key);

//   @override
//   State<NewMessageScreen> createState() => _NewMessageScreenState();
// }

// class _NewMessageScreenState extends State<NewMessageScreen> {

//   TextEditingController messageController = TextEditingController();
//   late IO.Socket _socket;
//   List<Map<String, dynamic>> messages = [];
//   SendMessagesController sendMessagesController = Get.put(SendMessagesController());
  
//   void sendMessage() {
//     String messageText = messageController.text.trim();
//     if (messageText.isNotEmpty) {
//       // Send a message to the server
//       sendMessagesController.sendMessages(widget.userId, widget.businessId, messageText);
//       final Map<String, dynamic> messageData = {
//       'sender_id': widget.userId, // Replace with the actual sender ID
//       'receiver_id': widget.businessId, // Replace with the actual receiver ID
//       'message_content': messageText,
//       'time_sent': DateTime.now().toIso8601String(), // Add timestamp
//     };
//       _socket.emit('message', {messageData});

//       setState(() {
//         messages.add({
//         'receiver_id': widget.businessId,
//         'sender_id': widget.userId,
//         'message_content':messageText,
//         'time_sent': DateTime.now().toIso8601String(),
//       });
//       });
//       messageController.clear();
//     }
//   }

//   String connectionStatus ='connecting';

//   @override
//   void connect(){

//     _socket= IO.io( 
//       'https://server.squeeky.org',
//       IO.OptionBuilder().setTransports(['websocket'])
//       .setQuery({'userId':widget.userId})
//       .disableAutoConnect()
//       .build());
//     _socket.connect();
//     _socket.onConnect((data){
//       // Join the room with the receiver ID
//       _socket.emit('join-user', widget.userId);
//       setState(() {
//         connectionStatus = 'Connected';
//       });
//       print('moti connect');
//     } 
//     );
//     _socket.onConnectError((data) => print('connection error'));

//     // Listen for messages from the server
//     _socket.on('message', (data) {
//       print(data);
//       setState(() {
//         messages.add({
//         'receiver_id': data['receiver_id'],
//         'sender_id': data['sender_id'],
//         'message_content': data['message'],
//         'time_sent': data['time_sent'],
//       });
//       });
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     connect();
//     getMessages();
//   }

//   void getMessages() async {
//   try {
//     var messageResponse = await sendMessagesController.getMessages(widget.userId, widget.businessId);
//     setState(() {
//       messages.addAll(messageResponse as Iterable<Map<String, dynamic>>);
//     });
//   } catch (e) {
//     print("Error getting messages: $e");
//     // Handle the error accordingly
//   }
// }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Mark"),
//         actions: [
//           Text(connectionStatus)
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 20), 
//         child: Container(
//           height: Get.height *0.88,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 leading: CircleAvatar(),
//                 title: Text("Power washing biz"),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Booked. 19 Jan"),
//                     Row(
//                       children: [
//                         TextButton.icon(onPressed: null, icon: Icon(Icons.door_front_door_outlined), label: Text("Business"),),
//                         TextButton.icon(onPressed: null, icon: Icon(Icons.share), label: Text("Share"),),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Divider(),
//               SizedBox(height: 15,),
//               Expanded(

//                 child: ListView.builder(
//   itemCount: messages.length,
//   itemBuilder: (context, index) {
//     final message = messages[index];
//     final isCurrentUser = message['sender_id'] == widget.userId; // Adjust this condition based on your user ID

//     return
    
//      ListTile(
      
//       title: Text(message['message_content'].toString()),
//       // subtitle: Text(message['time_sent'].toString()),
//       leading: CircleAvatar(),
//       trailing: isCurrentUser ? null : Icon(Icons.reply), // Show reply icon for received messages
//       tileColor: isCurrentUser ? const Color.fromARGB(255, 206, 239, 250) : Colors.white, // Highlight current user's messages
//       contentPadding: EdgeInsets.all(8.0),
//     );
//   },
// )


//                 // child: Column(
//                 //   children: [
//                 //     ListTile(
//                 //       contentPadding: EdgeInsets.zero,
//                 //       leading: CircleAvatar(),
//                 //       title: Row(
//                 //         children: [
//                 //           Text("Mark", style: text16,),
//                 //           Text("3:58 PM", )
//                 //         ],
//                 //       ),
//                 //       subtitle: Text("Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us! Hey! Thanks for booking with us!"),
//                 //     ),
                            
//                 //   ],
//                 // )
//                 ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 206, 239, 250),
//                   borderRadius: BorderRadius.circular(8)
//                 ),
//                 child: 
                
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: messageController,
//                           decoration: InputDecoration(
//                             hintText: 'Type a message...',
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.send),
//                         onPressed: sendMessage,
//                       ),
//                     ],
//                   ),
//                 ),
                
                
//                 // Row(
//                 //   crossAxisAlignment: CrossAxisAlignment.center,
//                 //   children: [
//                 //     Expanded(
//                 //       child: TextField(
//                 //         controller: messageController,
//                 //       )
//                 //     ),
//                 //     IconButton(onPressed: null, icon: Icon(Icons.send))
//                 //   ],
//                 // ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class NotificationDetailsScreen extends StatelessWidget {
  NotificationsModel notificationItem;
  
  NotificationDetailsScreen({Key? key, required this.notificationItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Squeeky Notifications"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListTile(
          title: Text(notificationItem.details),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(notificationItem.date, textAlign: TextAlign.end, style: text12L,),
          ),
        ),
      ),
    );
  }
}