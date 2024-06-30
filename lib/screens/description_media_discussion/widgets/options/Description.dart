import 'package:flutter/material.dart';

import '../../../../model/description.dart'; // Ensure this model correctly handles the business logic

class GroupMediaDescriptionWidget extends StatefulWidget {
  const GroupMediaDescriptionWidget({super.key});

  @override
  State<GroupMediaDescriptionWidget> createState() => _GroupMediaDescriptionWidgetState();
}

class _GroupMediaDescriptionWidgetState extends State<GroupMediaDescriptionWidget> {
  late final GroupMediaDescriptionModel _model;

  @override
  void initState() {
    super.initState();
    _model = GroupMediaDescriptionModel();
    _model.initializeControllers();
  }

  @override
  void dispose() {
    _model.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2A343D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  const Text( 'Modifier le groupe'),
        elevation: 3,
        shadowColor: Colors.black,
      ),// Assuming a similar color theme
      body: SafeArea(
        child: ListView(
          children: [
            _buildGroupFields(),
            _buildSubmitButton(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }


  Widget _buildTopBarItem(String title, String route, Color color) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color)),
    );
  }

  Widget _buildGroupFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField('Nom de groupe', _model.textController1, _model.textFieldFocusNode1),
          _buildStatusRadioButtons(),
          _buildTextField('Éditeur', _model.textController2, _model.textFieldFocusNode2),
          _buildTextField('l\'intéressé', _model.textController3, _model.textFieldFocusNode3),
          _buildTextField('Sujet', _model.textController4, _model.textFieldFocusNode4),
          _buildTextField('Description', _model.textController5, _model.textFieldFocusNode5),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, FocusNode focusNode) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }

  Widget _buildStatusRadioButtons() {
    return Column(
      children: ['En cours', 'Fermer', 'Résolu'].map((String value) {
        return ListTile(
          title: Text(value),
          leading: Radio<String>(
            value: value,
            groupValue: _model.radioButtonValue,
            onChanged: (String? newValue) {
              setState(() {
                _model.radioButtonValue = newValue!;
              });
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow[700],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        child: const Text('Ajouter un utilisateur', style: TextStyle(fontSize: 16 , color: Colors.white)),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'groupMediaDescriptionSuit'),
      backgroundColor: const Color(0xFFF4C534),
      child: const Icon(Icons.check_rounded, color: Colors.white),
    );
  }
}
