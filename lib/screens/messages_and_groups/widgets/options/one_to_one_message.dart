import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../comun/images_view.dart';

class ChatMessage {
  String messageContent;
  String senderName;
  String messageType;
  DateTime timestamp;
  String avatarUrl;
  File? imageFile;

  ChatMessage({
    required this.messageContent,
    required this.senderName,
    required this.messageType,
    required this.timestamp,
    required this.avatarUrl,
    this.imageFile,
  });
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [
    // Sample messages
  ];
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _handleSubmitted(String text) {
    _controller.clear();
    setState(() {
      messages.insert(
        0,
        ChatMessage(
          messageContent: text,
          senderName: "You",
          messageType: "sender",
          timestamp: DateTime.now(),
          avatarUrl: "assets/images/user.png",
        ),
      );
    });
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _sendImage(fromCamera: false);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _sendImage(fromCamera: true);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }
    );
  }

  Future<void> _sendImage({required bool fromCamera}) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 88,
    );
    if (pickedFile != null) {
      setState(() {
        messages.insert(
          0,
          ChatMessage(
            messageContent: "",
            senderName: "You",
            messageType: "sender",
            timestamp: DateTime.now(),
            avatarUrl: "assets/images/user.png",
            imageFile: File(pickedFile.path),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2A343D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  const Text( 'Nom de user '),
        elevation: 3,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child:ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var msg = messages[index];
                bool isMe = msg.messageType == "sender";
                double imageSize = MediaQuery.of(context).size.width * 0.3; // 30% of screen width
                imageSize = imageSize < 200 ? 200 : imageSize; // Ensuring a minimum width of 200 pixels

                double imageHeight = imageSize * 1.2; // 20% taller than its width

                return Row(
                    mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                if (!isMe && msg.imageFile == null)
                CircleAvatar(
                  backgroundImage: AssetImage(msg.avatarUrl),
                  radius: 16,
                ),
                GestureDetector(
                onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => FullScreenImagePage(imageFile: msg.imageFile!),
                ),
                );
                },
                child: msg.imageFile != null ? Container(
                margin: EdgeInsets.only(top: 10, bottom: 10, left: isMe ? 0 : 10, right: isMe ? 10 : 0),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Slightly rounded corners for aesthetics
                child: Image.file(
                msg.imageFile!,
                width: imageSize,
                height: imageHeight, // Height is now 120% of the width
                fit: BoxFit.cover,
                ),
                ),
                ) : Container(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isMe ? const Color(0xFFF4C534) : Colors.grey[200],
                ),
                child: Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                Text(
                msg.messageContent,
                softWrap: true,
                style: TextStyle(color: isMe ? Colors.white : Colors.black),
                ),
                const SizedBox(height: 5),
                Text(
                DateFormat('hh:mm a').format(msg.timestamp),
                style: TextStyle(
                fontSize: 10,
                color: isMe ? Colors.white : Colors.black45,
                ),
                softWrap: true,
                ),
                ],
                ),
                ),
                ),
                ],
                );
              },
            ),







          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _showOptions(context),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Send a message...",
                      fillColor: Colors.grey[100],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      _handleSubmitted(_controller.text);
                    }
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFFF4C534),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
