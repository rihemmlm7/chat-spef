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

  final List<Map<String, String>> interesses = [


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

  final List<Map<String, String>> members = [
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2A343D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: GestureDetector(
          onTap: _navigateToChangeGroupName,
          child: const Text(
            'Nom du groupe',
            style: TextStyle(color: Color(0xFF2A343D)),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
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
        elevation: 0,
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
                'Nom du groupe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Text('Groupe • 2 membres'),
            ),
            const SizedBox(height: 20),
            // ignore: prefer_const_constructors
            Row(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.supervised_user_circle,  color: Color.fromARGB(255, 244, 197, 52),),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Les intéressés (${interesses.length})',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Liste de tous les intéressés',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                
                                icon: Icon(Icons.edit),
                                color: Colors.grey,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const AddClientScreen(),
                                  ));
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            itemCount: interesses.length,
                            itemBuilder: (context, index) {
                              final interest = interesses[index];
                              return ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                                title: Text(interest['name']!),
                                subtitle: Text(interest['status']!),
                                onTap: () {
                                  // Handle member tap
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Membres (${members.length})', // Displaying number of members
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Add any other widgets you might need on the same row
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            itemCount: members.length,
                            itemBuilder: (context, index) {
                              final member = members[index];
                              return ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                                title: Text(member['name']!),
                                subtitle: Text(member['status']!),
                                onTap: () {
                                  // Handle member tap
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                     margin: const EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person_add, color: Color.fromARGB(255, 244, 197, 52)),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handleMenuSelection(BuildContext context, String choice) {
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
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

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
