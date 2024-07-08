import 'package:flutter/material.dart';
import 'package:massage/pages/Formulair.dart';

class AddClientPage extends StatefulWidget {
  @override
  _AddClientPageState createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  String _selectedType = 'type1';
  String _status = 'client';
  List<TextEditingController> _phoneControllers = [TextEditingController()];
  List<TextEditingController> _emailControllers = [TextEditingController()];

  Widget _buildTextField(String label, TextEditingController controller, FocusNode focusNode,
      {String? hintText, IconData? prefixIcon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }

  // Function to add a phone number
  void _addPhoneNumber() {
    setState(() {
      _phoneControllers.add(TextEditingController());
    });
  }

  // Function to remove a phone number at a given index
  void _removePhoneNumber(int index) {
    setState(() {
      _phoneControllers.removeAt(index);
    });
  }

  // Function to add an email address
  void _addEmailAddress() {
    setState(() {
      _emailControllers.add(TextEditingController());
    });
  }

  // Function to remove an email address at a given index
  void _removeEmailAddress(int index) {
    setState(() {
      _emailControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fiche de Client Prospecté'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(
                'Position',
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              trailing: Icon(
                Icons.place,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Status',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Row(
              children: [
                Radio(
                  activeColor: Colors.blue,
                  value: 'client',
                  groupValue: _status,
                  onChanged: (value) {
                    setState(() {
                      _status = value.toString();
                    });
                  },
                ),
                Text('Client'),
                SizedBox(width: screenSize.width / 4),
                Radio(
                  activeColor: Colors.blue,
                  value: 'prospect',
                  groupValue: _status,
                  onChanged: (value) {
                    setState(() {
                      _status = value.toString();
                    });
                  },
                ),
                Text('Prospect'),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Type',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            DropdownButtonFormField<String>(
              value: _selectedType,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              items: [
                DropdownMenuItem<String>(
                  value: 'type1',
                  child: Text('éleveur'),
                ),
                DropdownMenuItem<String>(
                  value: 'type2',
                  child: Text('Revendeur'),
                ),
                DropdownMenuItem<String>(
                  value: 'type3',
                  child: Text('coopérative'),
                ),
                DropdownMenuItem<String>(
                  value: 'type4',
                  child: Text('Revendeur et éleveur'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
            ),
            SizedBox(height: screenSize.height * 0.02),
            _buildTextField(
              'Nom',
              TextEditingController(),
              FocusNode(),
              hintText: 'Nom',
            ),
            SizedBox(height: screenSize.height * 0.02),
            _buildTextField(
              'Prénom',
              TextEditingController(),
              FocusNode(),
              hintText: 'Prénom',
            ),
            SizedBox(height: screenSize.height * 0.02),
            _buildTextField(
              'Nom de l\'Entreprise',
              TextEditingController(),
              FocusNode(),
              hintText: 'Nom de l\'Entreprise',
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Téléphone',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            // Display existing phone numbers using ListView.builder
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _phoneControllers.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _phoneControllers[index],
                          decoration: InputDecoration(
                            hintText: 'Téléphone',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          _removePhoneNumber(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            // Button to add more phone numbers
            GestureDetector(
              onTap: _addPhoneNumber,
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text('Ajouter un numéro de téléphone'),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),

            // Section for emails
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            // Display existing email addresses using ListView.builder
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _emailControllers.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _emailControllers[index],
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          _removeEmailAddress(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            // Button to add more email addresses
            GestureDetector(
              onTap: _addEmailAddress,
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text('Ajouter une adresse email'),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),

            // Existing code...

            _buildTextField(
              'RC',
              TextEditingController(),
              FocusNode(),
              hintText: 'RC',
            ),
            SizedBox(height: screenSize.height * 0.02),
            _buildTextField(
              'AI',
              TextEditingController(),
              FocusNode(),
              hintText: 'AI',
            ),
            SizedBox(height: screenSize.height * 0.02),
            _buildTextField(
              'NIF',
              TextEditingController(),
              FocusNode(),
              hintText: 'NIF',
            ),
            SizedBox(height: screenSize.height * 0.02),
            _buildTextField(
              'NIC',
              TextEditingController(),
              FocusNode(),
              hintText: 'NIC',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
         elevation: 0,
        color: Color(0xFFE8E8E8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Annuler',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Formulaire()),
                );
              },
              child: Text(
                'Valider',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
