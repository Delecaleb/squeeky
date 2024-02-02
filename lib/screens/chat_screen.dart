import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../controllers/send_messages_controller.dart';


class NewMessageScreen extends StatefulWidget {
  
  String userId, businessId;
  
  NewMessageScreen({Key? key, required this.businessId, required this.userId}) : super(key: key);

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
      'time_sent': DateTime.now().toIso8601String(), // Add timestamp
    };
      _socket.emit('message', {messageData});

      setState(() {
        messages.add({
        'receiver_id': widget.businessId,
        'sender_id': widget.userId,
        'message_content':messageText,
        'time_sent': DateTime.now().toIso8601String(),
      });
      });
      messageController.clear();
    }
  }

  String connectionStatus ='connecting';

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
      print('moti connect');
    } 
    );
    _socket.onConnectError((data) => print('connection error == ${data}'));

    // Listen for messages from the server
    _socket.on('message', (data) {
      // print(data);
      setState(() {
        messages.add({
        'receiver_id': data['receiver_id'],
        'sender_id': data['sender_id'],
        'message_content': data['message'],
        'time_sent': data['time_sent'],
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
    print("Error getting messages: $e");
    // Handle the error accordingly
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mark"),
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

                child: ListView.builder(
  itemCount: messages.length,
  itemBuilder: (context, index) {
    final message = messages[index];
    final isCurrentUser = message['sender_id'] == widget.userId; // Adjust this condition based on your user ID

    return
    
     ListTile(
      
      title: Text(message['message_content'].toString()),
      // subtitle: Text(message['time_sent'].toString()),
      leading: CircleAvatar(),
      trailing: isCurrentUser ? null : Icon(Icons.reply), // Show reply icon for received messages
      tileColor: isCurrentUser ? const Color.fromARGB(255, 206, 239, 250) : Colors.white, // Highlight current user's messages
      contentPadding: EdgeInsets.all(8.0),
    );
  },
)

                ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 206, 239, 250),
                  borderRadius: BorderRadius.circular(8)
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
                            hintText: 'Type a message...',
                          ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}


