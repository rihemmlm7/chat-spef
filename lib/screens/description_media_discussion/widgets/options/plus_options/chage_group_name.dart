import 'package:flutter/material.dart';

class GroupNameInputScreen extends StatefulWidget {
  final String initialGroupName;
  final int maxGroupNameLength;
  final String title;
  final String lable;
  final IconData? suffixIcon;
  final Function(String)? onConfirm;

  const GroupNameInputScreen({
    super.key,
    this.initialGroupName = '',
    this.maxGroupNameLength = 96,
    required this.title,
    required this.lable,
    this.suffixIcon,
    this.onConfirm,
  });

  @override
  _GroupNameInputScreenState createState() => _GroupNameInputScreenState();
}

class _GroupNameInputScreenState extends State<GroupNameInputScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialGroupName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              maxLength: widget.maxGroupNameLength,
              decoration: InputDecoration(
                labelText: widget.lable,
                suffixIcon:
                    widget.suffixIcon != null ? Icon(widget.suffixIcon) : null,
                border: const UnderlineInputBorder(),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Annuler
                  },
                  child: const Text(
                    'Annuler',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final groupName = _controller.text;
                    if (widget.onConfirm != null) {
                      widget.onConfirm!(groupName);
                    } else {
                      print('Nom du groupe: $groupName');
                    }
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
