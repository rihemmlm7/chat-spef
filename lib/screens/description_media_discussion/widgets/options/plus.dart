import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:massage/screens/description_media_discussion/widgets/options/comun_widgets/liste_title.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/comun_widgets/setting_title.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/plus_options/add_client.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/plus_options/add_members.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/plus_options/autorisations.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/plus_options/chage_group_name.dart';

class PlusOption extends StatefulWidget {
  const PlusOption({Key? key}) : super(key: key);

  @override
  _PlusOptionState createState() => _PlusOptionState();
}

class _PlusOptionState extends State<PlusOption> {
  File? _groupImage;
  final picker = ImagePicker();

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

  final List<Map<String, String>> client = [
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

  Future<void> _pickGroupImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _groupImage = File(pickedFile.path);
      });
    }
  }

  void _navigateToChangeGroupName() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const GroupNameInputScreen(
        title: 'Saisir le nom du groupe',
        lable: 'Nom du groupe',
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2A343D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: GestureDetector(
          onTap: _navigateToChangeGroupName,
          child: const Text(
            'Nom de group',
            style: TextStyle(color: Color(0xFF2A343D)),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Action based on selection
              handleMenuSelection(context, result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Ajouter des membres',
                child: Text('Ajouter des membres'),
              ),
              const PopupMenuItem<String>(
                value: 'Changer le nom du groupe',
                child: Text('Changer le nom du groupe'),
              ),
              const PopupMenuItem<String>(
                value: 'Autorisations du groupe',
                child: Text('Autorisations du groupe'),
              ),
            ],
            icon: const Icon(Icons.more_vert, color: Color(0xFF2A343D)),
          ),
        ],
        elevation: 3,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: _pickGroupImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                backgroundImage:
                    _groupImage != null ? FileImage(_groupImage!) : null,
                child: _groupImage == null
                    ? const Icon(Icons.group, size: 60, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Test',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Text('Groupe • 2 membres'),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GroupActionButton(icon: Icons.person_add, label: 'Ajouter'),
                GroupActionButton(icon: Icons.search, label: 'Rechercher'),
              ],
            ),
            const Divider(height: 40),
            SettingsScreen(),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingTile(
                  icon: Icons.supervised_user_circle,
                  suffixIcon: Icons.edit,
                  title: 'Les intéressés',
                  subtitle: 'la liste du tout Les intéressés',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddClientScreen(),
                    ));
                  },
                  hasShadow: true,
                ),
                SizedBox(
                  height: 150, // Fixed height for the list of members
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
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingTile(
                  icon: Icons.supervised_user_circle,
                  title: 'Membres',
                  subtitle: 'la liste du tout les membres de groupe ',
                  onTap: () {},
                  hasShadow: true,
                ),
                SizedBox(
                  height: 150, // Fixed height for the list of members
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
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              leading: const Icon(Icons.person_add,
                  color: Color.fromARGB(255, 244, 197, 52)),
              title: const Text(
                'Ajouter un membre',
                style: TextStyle(color: Color.fromARGB(255, 244, 197, 52)),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddMembersScreen(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text(
                'Quitter le groupe',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Handle "Quitter le groupe"
              },
            ),
            ListTile(
              leading: const Icon(Icons.thumb_down, color: Colors.red),
              title: const Text(
                'Signaler le groupe',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Handle "Signaler le groupe"
              },
            ),
          ],
        ),
      ),
    );
  }

  void handleMenuSelection(BuildContext context, String choice) {
    // This function can handle various actions based on the menu choice
    // Example of navigating or displaying a message
    switch (choice) {
      case 'Ajouter des membres':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddMembersScreen(),
        ));
        break;
      case 'Changer le nom du groupe':
        _navigateToChangeGroupName();
        break;
      case 'Autorisations du groupe':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GroupPermissionsScreen(),
        ));
        break;
      default:
        print('Unknown option: $choice');
    }
  }
}

class GroupActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const GroupActionButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: const Color.fromARGB(255, 244, 197, 52),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
