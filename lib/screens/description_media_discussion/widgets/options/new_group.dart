import 'package:flutter/material.dart';

class NewGroupWidget extends StatefulWidget {
  const NewGroupWidget({super.key});

  @override
  _NewGroupWidgetState createState() => _NewGroupWidgetState();
}

class _NewGroupWidgetState extends State<NewGroupWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Set<int> _selectedContacts = <int>{}; // State to track selected contacts
  final TextEditingController _searchController = TextEditingController(); // Controller for search bar

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Créer un nouveau groupe',

          ),
          elevation: 1,
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
                itemCount: 10, // Simulated number of contacts
                itemBuilder: (context, index) => buildContactTile(context, index),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your navigation or action logic here
            Navigator.of(context).pushNamed('detail2');
          },
          backgroundColor: const Color(0xFFF4C534),
          child: const Icon(Icons.check, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildContactTile(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectedContacts.contains(index)) {
            _selectedContacts.remove(index);
          } else {
            _selectedContacts.add(index);
          }
        });
      },
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/user.png'),
        ),
        title: Text(
          'Nom d’utilisateur $index',

        ),
        subtitle: Text('Message $index'),
        trailing: Transform.scale(
          scale: 1.3,
          child: Checkbox(
            value: _selectedContacts.contains(index),
            onChanged: (bool? value) {
              setState(() {
                if (value ?? false) {
                  _selectedContacts.add(index);
                } else {
                  _selectedContacts.remove(index);
                }
              });
            },
            shape: const CircleBorder(),
            side: const BorderSide(color: Colors.yellow),
            activeColor: Colors.black, // Optional: change to your preferred color
          ),
        ),
      ),
    );
  }

}
