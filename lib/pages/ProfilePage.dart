import 'package:flutter/material.dart';
import 'package:massage/components/HistoriqueProfile.dart';
import 'package:massage/pages/FicheClientPros.dart';
import 'package:massage/pages/ClientVisitPage.dart';
import 'package:massage/components/CustomCard.dart'; // Import the CustomCard widget
import 'package:massage/components/CustomCard2.dart'; 

class ProfilePage extends StatelessWidget {
  // Example dynamic data
  final Map<String, String> userData = {
    'address': '123 Street, City, Country',
    'telephone': '123456789',
    'email': 'john.doe@example.com',
    'RC': '123456789RC',
    'AI': '123456789AI',
    'NIF': '123456789NIF',
    'NIC': '123456789NIC',
    // Add more fields as needed
  };

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.grey[300],
                  shape: CircleBorder(),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Material(
                  color: Colors.grey[300],
                  shape: CircleBorder(),
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddClientPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://picsum.photos/seed/9/600'),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'John Doe',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: screenHeight * 0.03),
          FractionallySizedBox(
            widthFactor: 1,
            child: Divider(
              color: Colors.grey[300],
              thickness: screenHeight * 0.002,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          CustomCard(
            icon1: Icons.location_on,
            title1: 'Address',
            subtitle1: userData['address'] ?? 'Not available',
            icon2: Icons.phone,
            title2: 'Telephone',
            subtitle2: userData['telephone'] ?? 'Not available',
            icon3: Icons.email,
            title3: 'Email',
            subtitle3: userData['email'] ?? 'Not available',
          ),
          SizedBox(height: 4.0),
          CustomCard2(
            title1: 'RC',
            subtitle1: userData['RC'] ?? 'Not available',
            title2: 'AI',
            subtitle2: userData['AI'] ?? 'Not available',
            title3: 'NIF',
            subtitle3: userData['NIF'] ?? 'Not available',
          ),
          SizedBox(height: screenHeight * 0.01),
          FractionallySizedBox(
            widthFactor: 1,
            child: Divider(
              color: Colors.grey[300],
              thickness: screenHeight * 0.002,
            ),
          ),
          HistoriqueProfile(),
          SizedBox(height: screenHeight * 0.05), // Add some bottom padding
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClientVisitPage(),
            ),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.note_add, color: Colors.white),
        shape: CircleBorder(),
      ),
    );
  }
}
