import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onChanged;

  const CustomSearchWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: false,
      obscureText: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Recherche',
        filled: true,
        fillColor: Colors.grey[350], // You can set your desired color here
        prefixIcon: Icon(
          Icons.search_sharp,
          color: Colors.grey[800], // You can set your desired icon color here
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        // Adjust the height of the search field by setting content padding
        contentPadding: EdgeInsets.symmetric(vertical: 15.0), // Adjust this value as needed
      ),
      style: TextStyle(
        fontFamily: 'Open Sans',
        letterSpacing: 0,
      ),
      validator: (value) {
        return null;
      },
    );
  }
}
