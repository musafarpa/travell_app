import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelapp/View/Screen/details_page/chatscreen/chatservice.dart';
import 'package:travelapp/View/Screen/details_page/maps.dart';
import 'package:uuid/uuid.dart';

class chatpage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  const chatpage(
      {super.key,
        required this.receiverUserEmail,
        required this.receiverUserID});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  final TextEditingController _messageController = TextEditingController();
  final Chatservice _chatService = Chatservice();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  // Future uploadImage() async {
  //   String fileName = Uuid().v1();
  //   int status = 1;
  //
  //   await _firestore
  //       .collection('chatroom')
  //       .doc(chatRoomId)
  //       .collection('chats')
  //       .doc(fileName)
  //       .set({
  //     "sendby": _firebaseAuth.currentUser!.displayName,
  //     "message": "",
  //     "type": "img",
  //     "time": FieldValue.serverTimestamp(),
  //   });
  //
  //   var ref =
  //   FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");
  //
  //   var uploadTask = await ref.putFile(imageFile!).catchError((error) async {
  //     await _firestore
  //         .collection('chatroom')
  //         .doc(chatRoomId)
  //         .collection('chats')
  //         .doc(fileName)
  //         .delete();
  //
  //     status = 0;
  //   });
  //
  //   if (status == 1) {
  //     String imageUrl = await uploadTask.ref.getDownloadURL();
  //
  //     await _firestore
  //         .collection('chatroom')
  //         .doc(chatRoomId)
  //         .collection('chats')
  //         .doc(fileName)
  //         .update({"message": imageUrl});
  //
  //     print(imageUrl);
  //   }
  // }
  void sendMessage() async {
    if (_messageController.text.isNotEmpty || _chatService.imageFile != null) {
      await _chatService.sendMessage(
        widget.receiverUserID,
        _messageController.text,
        _chatService.imageFile?.path,
      );
      _messageController.clear();
      _chatService.imageFile = null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList(),
          ),
          _buildMessageInput(),
        ],
      ),
    );

  }

  Widget _buildMessageList(){
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverUserID, _firebaseAuth.currentUser!.uid),
        builder:(context, snapshot) {
          if (snapshot.hasError){
            return Text('Error${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }
          return ListView(
            children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList(),
          );
        }
    );
  }


  Widget _buildMessageItem(document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment =
    (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return GestureDetector(
      onLongPress: () {
        if (data['senderId'] == _firebaseAuth.currentUser!.uid)
          _showDeleteDialog(document.id, _firebaseAuth.currentUser!.uid);
      },
      child: Container(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: (data['senderId'] ==
                _firebaseAuth.currentUser!.uid)
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            mainAxisAlignment: (data['senderId'] ==
                _firebaseAuth.currentUser!.uid)
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Text(data['senderEmail']),
              if (data['type'] == 'img' && data['imagepath'] != null && data['imagepath'] != '')
                Image.network(data['imagepath']),


              Text(data['message']),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(String messageId, String senderId) {
    // Get the UID of the current user
    String currentUserUid = _firebaseAuth.currentUser?.uid ?? '';

    // Check if the current user is the sender of the message
    bool isSender = senderId == currentUserUid;

    // If the current user is not the sender, return without showing the dialog
    if (!isSender) {
      return;
    }

    // Show the delete dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Message'),
          content: Text('Are you sure you want to delete this message?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _chatService.delete(widget.receiverUserID, messageId);
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
  Widget _buildMessageInput(){
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(
              suffixIcon: IconButton(onPressed: () => _chatService.getImage(widget.receiverUserID),
                  icon: Icon(Icons.photo)),
              hintText: 'Enter a message',
            ),
            obscureText: false,
          ),
        ),
        IconButton(onPressed: sendMessage, icon:const Icon(Icons.arrow_upward,
          size: 40,))
      ],
    );

  }

}