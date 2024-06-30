import 'package:flutter/material.dart';

class ContactsWidget extends StatefulWidget {
  const ContactsWidget({super.key});

  @override
  _ContactsWidgetState createState() => _ContactsWidgetState();
}

class _ContactsWidgetState extends State<ContactsWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize your model here if needed
  }

  @override
  void dispose() {
    _searchController.dispose();
    // Dispose additional controllers or nodes if created
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // This will unfocus any focused fields when tapping outside them.
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contacts',
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 2,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Rechercher',
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Implement your search logic here
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Adjust the item count based on your model or data
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                    title: Text(
                      'Nom d’utilisateur ${index + 1}'
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
