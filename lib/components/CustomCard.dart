import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final IconData icon1;
  final String title1;
  final String subtitle1;
  final IconData icon2;
  final String title2;
  final String subtitle2;
  final IconData icon3;
  final String title3;
  final String subtitle3;

  CustomCard({
    required this.icon1,
    required this.title1,
    required this.subtitle1,
    required this.icon2,
    required this.title2,
    required this.subtitle2,
    required this.icon3,
    required this.title3,
    required this.subtitle3,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  leading: Icon(widget.icon1),
                  title: Text(
                    widget.title1,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023),
                  ),
                  subtitle: Text(
                    widget.subtitle1,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showMore = !showMore;
                  });
                },
                child: Icon(showMore ? Icons.expand_less : Icons.expand_more),
              ),
            ],
          ),
          if (showMore) ...[
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              leading: Icon(widget.icon2),
              title: Text(
                widget.title2,
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023),
              ),
              subtitle: Text(
                widget.subtitle2,
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              leading: Icon(widget.icon3),
              title: Text(
                widget.title3,
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023),
              ),
              subtitle: Text(
                widget.subtitle3,
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
