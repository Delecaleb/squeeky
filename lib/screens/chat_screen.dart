import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:squeeky/style/textstyles.dart';
import '../controllers/send_messages_controller.dart';
import '../widgets.dart';


class NewMessageScreen extends StatefulWidget {
  
  String userId, businessId, businessName, imageUrl, booked, serviceOffered;
  
  NewMessageScreen({Key? key, required this.serviceOffered, required this.booked, required this.imageUrl, required this.businessId, required this.businessName, required this.userId}) : super(key: key);

  @override
  State<NewMessageScreen> createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {

  TextEditingController messageController = TextEditingController();
  late IO.Socket _socket;
  List<Map<String, dynamic>> messages = [];
  SendMessagesController sendMessagesController = Get.put(SendMessagesController());
  
  void sendMessage() {
    String messageText = messageController.text.trim();
    if (messageText.isNotEmpty) {
      // Send a message to the server
      sendMessagesController.sendMessages(widget.userId, widget.businessId, messageText);
      final Map<String, dynamic> messageData = {
      'sender_id': widget.userId, // Replace with the actual sender ID
      'receiver_id': widget.businessId, // Replace with the actual receiver ID
      'message_content': messageText,
      'created_at': DateTime.now().toIso8601String(), // Add timestamp
    };
      _socket.emit('message', {messageData});

      setState(() {
        messages.add({
        'receiver_id': widget.businessId,
        'sender_id': widget.userId,
        'message_content':messageText,
        'created_at': DateTime.now().toIso8601String(),
      });
      });
      messageController.clear();
    }
  }

  String connectionStatus ='';

  @override
  void connect(){

    _socket= IO.io( 
      'https://server.squeeky.org',
      IO.OptionBuilder().setTransports(['websocket'])
      .setQuery({'userId':widget.userId})
      .disableAutoConnect()
      .build());
    _socket.connect();
    _socket.onConnect((data){
      // Join the room with the receiver ID
      _socket.emit('join-user', widget.userId);
      setState(() {
        connectionStatus = 'Connected';
      });
    } 
    );
    _socket.onConnectError((data) => print('connection error == ${data}'));

    // Listen for messages from the server
    _socket.on('message', (data) {
     
      setState(() {
        messages.add({
        'receiver_id': data['receiver_id'],
        'sender_id': data['sender_id'],
        'message_content': data['message'],
        'created_at': data['created_at'],
      });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    getMessages();
  }

  void getMessages() async {
  try {
    var messageResponse = await sendMessagesController.getMessages(widget.userId, widget.businessId);
    setState(() {
      messages.addAll(messageResponse as Iterable<Map<String, dynamic>>);
    });
  } catch (e) {
    // Handle the error accordingly
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.businessName),
        actions: [
          Text(connectionStatus)
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20), 
        child: Container(
          height: Get.height *0.88,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: widget.imageUrl !='' &&  widget.imageUrl.isNotEmpty ? NetworkImage('https://squeeky.org/dashboard/businessfiles/${widget.imageUrl}') : null,
                  backgroundColor: const Color(0xFFD9D9D9),
                ),
                title: Text(widget.businessName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Booked. ${widget.booked}"),
                    Row(
                      children: [
                        TextButton.icon(onPressed: null, icon: Icon(Icons.door_front_door_outlined), label: Text("Business"),),
                        TextButton.icon(onPressed: ()=>Share.share("Hey there! I just discovered this amazing business on Squeeky that offers ${widget.serviceOffered}. I've had a fantastic experience, and I thought you might find it useful too. Check it out on Squeeky!", subject:"Use ${widget.businessName} Service on Squeeky"), icon: Icon(Icons.share), label: Text("Share"),),
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 15,),
              Expanded(
  child: ListView.builder(
    itemCount: messages.length,
    itemBuilder: (context, index) {
      final message = messages[index];
      final isCurrentUser = message['sender_id'] == widget.userId;
      DateTime rawDate = DateTime.parse(message['created_at'].toString());
      var formattedDate = DateFormat("MMM d, yyyy").format(rawDate);
      var chatTime = DateFormat("h:mm a").format(rawDate);
      var previousMessageDate = index > 0 ? DateTime.parse(messages[index - 1]['created_at'].toString()) : DateTime.now().subtract(Duration(days: 1));
      var isSameDate = rawDate.year == previousMessageDate.year && rawDate.month == previousMessageDate.month && rawDate.day == previousMessageDate.day;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSameDate)
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                formattedDate,
                style: text12,
                textAlign:TextAlign.center
              ),
            ),
          // ListTile(
          //   title: isCurrentUser ? Text("Me") : Text(widget.businessName),
          //   subtitle: Text(message['message_content'].toString()),
          //   trailing: isCurrentUser
          //       ? CircleAvatar(
          //           radius: 25.0,
          //           backgroundImage: sendMessagesController.userDp != '' && sendMessagesController.userDp.isNotEmpty
          //               ? NetworkImage('https://squeeky.org/api/usersPhoto/${sendMessagesController.userDp}')
          //               : null,
          //           backgroundColor: const Color(0xFFD9D9D9),
          //         )
          //       : CircleAvatar(
          //           radius: 25.0,
          //           backgroundImage: widget.imageUrl != '' && widget.imageUrl.isNotEmpty
          //               ? NetworkImage('https://squeeky.org/dashboard/businessfiles/${widget.imageUrl}')
          //               : null,
          //           backgroundColor: const Color(0xFFD9D9D9),
          //         ),
          // ),
          !isCurrentUser ?
              ReplyMessage(message: message['message_content'].toString(), time: chatTime,)
              // ListTile(
                
              //   title:  Text("${widget.businessName} ${chatTime}", style: text12L,),
              //   subtitle: Text(message['message_content'].toString()),
              //   leading: CircleAvatar(
              //               radius: 25.0,
              //               backgroundImage: widget.imageUrl !='' &&  widget.imageUrl.isNotEmpty ? NetworkImage('https://squeeky.org/dashboard/businessfiles/${widget.imageUrl}') : null,
              //               backgroundColor: const Color(0xFFD9D9D9),
              //             ), 
              //   contentPadding: EdgeInsets.zero,
              // )
              :
              OwnMessage(message: message['message_content'].toString(), time: chatTime,)
              // ListTile(
                
              //   title:  Text(" ${chatTime }", style: text12L, textAlign: TextAlign.right,),
              //   subtitle: Text(message['message_content'].toString(), textAlign: TextAlign.right),
              //   trailing: CircleAvatar(
              //               radius: 25.0,
              //               backgroundImage:sendMessagesController.userDp !='' && sendMessagesController.userDp.isNotEmpty ? NetworkImage('https://squeeky.org/api/usersPhoto/${sendMessagesController.userDp}') : null,
              //               backgroundColor: const Color(0xFFD9D9D9),
              //             ), 
              //   contentPadding: EdgeInsets.zero,
              // )
        ],
      );
    },
  ),
),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: 
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write a message...',
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: sendMessage,
                      ),
                    ],
                  ),
                ),
                
                
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: TextField(
                //         controller: messageController,
                //       )
                //     ),
                //     IconButton(onPressed: null, icon: Icon(Icons.send))
                //   ],
                // ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}


