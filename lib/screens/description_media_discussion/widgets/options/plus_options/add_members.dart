import 'package:flutter/material.dart';

class AddMembersScreen extends StatefulWidget {
  const AddMembersScreen({super.key});

  @override
  _AddMembersScreenState createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddMembersScreen> {
  final List<Map<String, String>> contacts = [
    {
      'name': 'Maria',
      'status': 'Le rôle de cet membre.',
    },
    {
      'name': '👑Lil Shine👑',
      'status': 'Le rôle de cet membre',
    },
    {
      'name': 'A_m',
      'status': 'Le rôle de cet membre',
    },
    {
      'name': 'Abdellah',
      'status': 'Le rôle de cet membre',
    },
    {
      'name': 'Abdelilah',
      'status': 'Le rôle de cet membre',
    },
    {
      'name': 'Abdelmadjid Riah',
      'status': 'Le rôle de cet membre',
    },
    {
      'name': 'Abdulaziz Abu Abdulrahman',
      'status': 'Le rôle de cet membre',
    },
    {
      'name': 'Abdu Rabo',
      'status': 'Le rôle de cet membre',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter des membres'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Tous les membres peuvent ajouter d\'autres personnes à ce groupe. Modifier les autorisations du groupe.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Contacts sur WhatsApp',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(contact['name']!),
                  subtitle: Text(contact['status']!),
                  trailing: const Icon(Icons.group_add),
                  onTap: () {
                    // Handle adding member to group
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
