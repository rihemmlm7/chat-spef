import 'package:flutter/material.dart';
import 'package:massage/pages/history.dart';

class NotifComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool expanded = false;
    final double width = MediaQuery.of(context).size.width * 0.9;
    final String prospect = 'Prospect';
    final String time = 'Il y a 30 min';
    final String newClient = '🌟 Nouveau client:';
    final String description = 'Un nouveau prospect, [Nom de client], a été ajouté.';

    return GestureDetector(
      
      child: Container(
        padding: EdgeInsets.all(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2),
            Container(
              
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '$prospect:',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red[700],
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    newClient,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                    maxLines: expanded ? null : 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
