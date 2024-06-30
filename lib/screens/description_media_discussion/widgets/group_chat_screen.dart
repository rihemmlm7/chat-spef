import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:massage/screens/description_media_discussion/widgets/media_lecture/PDFViewerPage.dart';
import 'package:massage/screens/description_media_discussion/widgets/media_lecture/VideoViewerPage.dart';

import '../../comun/images_view.dart';

class ChatMessage {
  String messageContent;
  String senderName;
  String messageType;
  DateTime timestamp;
  String avatarUrl;
  File? file;
  String? fileType;

  ChatMessage({
    required this.messageContent,
    required this.senderName,
    required this.messageType,
    required this.timestamp,
    required this.avatarUrl,
    this.file,
    this.fileType,
  });
}

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  List<ChatMessage> messages = [
    ChatMessage(
      messageContent: "That sounds great!",
      senderName: "John Doe",
      messageType: "receiver",
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      avatarUrl: "assets/images/user.png",
    ),
    ChatMessage(
      messageContent: "Indeed, the earlier we can",
      senderName: "Jane Smith",
      messageType: "receiver",
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      avatarUrl: "assets/images/user.png",
    ),
    ChatMessage(
      messageContent: "Can we finalize the meeting by tomorrow?",
      senderName: "Will Johnson",
      messageType: "sender",
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      avatarUrl: "assets/images/user.png",
    ),
    ChatMessage(
      messageContent: "I’ll share the agenda by EOD today.",
      senderName: "Emma Brown",
      messageType: "receiver",
      timestamp: DateTime.now().subtract(const Duration(seconds: 30)),
      avatarUrl: "assets/images/user.png",
    ),
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
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _sendImage(fromCamera: true);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_library),
                title: const Text('Vidéo Library'),
                onTap: () {
                  _sendVideo(fromCamera: false);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_camera_back),
                title: const Text('Caméra Vidéo'),
                onTap: () {
                  _sendVideo(fromCamera: true);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_file),
                title: const Text('Fichier PDF'),
                onTap: () {
                  _sendPDF();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
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
            file: File(pickedFile.path),
            fileType: "image",
          ),
        );
      });
    }
  }

  Future<void> _sendVideo({required bool fromCamera}) async {
    final XFile? pickedFile = await _picker.pickVideo(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
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
            file: File(pickedFile.path),
            fileType: "video",
          ),
        );
      });
    }
  }

  Future<void> _sendPDF() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        messages.insert(
          0,
          ChatMessage(
            messageContent: "",
            senderName: "You",
            messageType: "sender",
            timestamp: DateTime.now(),
            avatarUrl: "assets/images/user.png",
            file: File(result.files.single.path!),
            fileType: "pdf",
          ),
        );
      });
    }
  }

  Widget _buildMessageContent(ChatMessage msg, bool isMe) {
    double imageSize = MediaQuery.of(context).size.width * 0.3;
    imageSize = imageSize < 200 ? 200 : imageSize;
    double imageHeight = imageSize * 1.2;

    if (msg.file != null) {
      switch (msg.fileType) {
        case "image":
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FullScreenImagePage(imageFile: msg.file!),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: isMe ? 0 : 10,
                right: isMe ? 10 : 0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  msg.file!,
                  width: imageSize,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        case "video":
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoViewerPage(videoFile: msg.file!),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: isMe ? 0 : 10,
                right: isMe ? 10 : 0,
              ),
              child: const Row(
                children: [
                  Icon(Icons.videocam, size: 30, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Vidéo', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        case "pdf":
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewerPage(pdfFile: msg.file!),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: isMe ? 0 : 10,
                right: isMe ? 10 : 0,
              ),
              child: const Row(
                children: [
                  Icon(Icons.picture_as_pdf, size: 30, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Document PDF', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        default:
          return Container();
      }
    } else {
      return Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isMe ? const Color(0xFFF4C534) : Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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
                  fontSize: 10, color: isMe ? Colors.white : Colors.black45),
              softWrap: true,
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var msg = messages[index];
                bool isMe = msg.messageType == "sender";

                return Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isMe && msg.file == null)
                      CircleAvatar(
                        backgroundImage: AssetImage(msg.avatarUrl),
                        radius: 16,
                      ),
                    _buildMessageContent(msg, isMe),
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

void main() => runApp(MaterialApp(home: GroupChatScreen()));
