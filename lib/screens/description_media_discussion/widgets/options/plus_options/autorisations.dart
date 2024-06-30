import 'package:flutter/material.dart';

class GroupPermissionsScreen extends StatefulWidget {
  const GroupPermissionsScreen({super.key});

  @override
  _GroupPermissionsScreenState createState() => _GroupPermissionsScreenState();
}

class _GroupPermissionsScreenState extends State<GroupPermissionsScreen> {
  bool canEditGroupSettings = true;
  bool canSendMessages = true;
  bool canAddMembers = true;
  bool adminsApproveNewMembers = false;

  final Color iconColor = const Color.fromARGB(255, 244, 197, 52);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autorisations du groupe'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Les membres peuvent :',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(255, 244, 197, 52)),
          ),
          ListTile(
            leading: Icon(Icons.edit, color: iconColor),
            title: const Text('Modifier les paramètres du groupe'),
            subtitle: const Text(
                'Cela comprend le nom, l\'icône, la description, le délai avant disparition des messages éphémères, ainsi que l\'option d\'épingler et de garder ou de ne plus garder des messages.'),
            trailing: Switch(
              value: canEditGroupSettings,
              onChanged: (value) {
                setState(() {
                  canEditGroupSettings = value;
                });
              },
              activeColor: iconColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.message, color: iconColor),
            title: const Text('Envoyer des messages'),
            trailing: Switch(
              value: canSendMessages,
              onChanged: (value) {
                setState(() {
                  canSendMessages = value;
                });
              },
              activeColor: iconColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_add, color: iconColor),
            title: const Text('Ajouter d\'autres membres'),
            trailing: Switch(
              value: canAddMembers,
              onChanged: (value) {
                setState(() {
                  canAddMembers = value;
                });
              },
              activeColor: iconColor,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Les admins peuvent :',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(255, 244, 197, 52)),
          ),
          ListTile(
            leading: Icon(Icons.person, color: iconColor),
            title: const Text('Approuver de nouveaux membres'),
            subtitle: const Text(
                'Lorsque cette option est activée, les admins doivent approuver toute demande d\'adhésion au groupe.'),
            trailing: Switch(
              value: adminsApproveNewMembers,
              onChanged: (value) {
                setState(() {
                  adminsApproveNewMembers = value;
                });
              },
              activeColor: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
