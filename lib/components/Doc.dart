import 'package:flutter/material.dart';

class DocumentItem extends StatelessWidget {
  final String documentName;
  final DateTime date;

  DocumentItem({required this.documentName, required this.date});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01, horizontal: screenWidth * 0.02),
      child: Row(
        children: [
          Icon(Icons.description),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    documentName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '${date.day}/${date.month}/${date.year}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
