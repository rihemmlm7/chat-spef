import 'package:flutter/material.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  _AddMembersScreenState createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddClientScreen> {
  final List<Map<String, String>> contacts = [
    {
      'name': 'Maria',
      'status': 'Indice sur le client',
    },
    {
      'name': '👑Lil Shine👑',
      'status': 'Indice sur le client',
    },
    {
      'name': 'A_m',
      'status': 'Indice sur le client',
    },
    {
      'name': 'Abdellah',
      'status': 'Indice sur le client',
    },
    {
      'name': 'Abdelilah',
      'status': 'Indice sur le client',
    },
    {
      'name': 'Abdelmadjid Riah',
      'status': 'Indice sur le client.',
    },
    {
      'name': 'Abdulaziz Abu Abdulrahman',
      'status': 'Indice sur le client',
    },
    {
      'name': 'Abdu Rabo',
      'status': 'Indice sur le client',
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
              'Tous les membres peuvent ajouter d\'autres intéressés pour ce groupe. Modifier les autorisations du groupe.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Liste des intéressés',
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
