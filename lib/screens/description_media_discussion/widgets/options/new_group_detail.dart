import 'package:flutter/material.dart';

class NewGroupDetailModel {
  TextEditingController textController1 = TextEditingController();
  FocusNode textFieldFocusNode1 = FocusNode();
  TextEditingController textController2 = TextEditingController();
  FocusNode textFieldFocusNode2 = FocusNode();
  TextEditingController textController3 = TextEditingController();
  FocusNode textFieldFocusNode3 = FocusNode();
  String? dropDownValue;
}

class NewGroupDetailWidget extends StatefulWidget {
  const NewGroupDetailWidget({super.key});

  @override
  _NewGroupDetailWidgetState createState() => _NewGroupDetailWidgetState();
}

class _NewGroupDetailWidgetState extends State<NewGroupDetailWidget> {
  final NewGroupDetailModel _model = NewGroupDetailModel();

  @override
  void dispose() {
    _model.textController1.dispose();
    _model.textFieldFocusNode1.dispose();
    _model.textController2.dispose();
    _model.textFieldFocusNode2.dispose();
    _model.textController3.dispose();
    _model.textFieldFocusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouveau Groupe'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputField(_model.textController1, 'Nom de groupe'),
              _buildDropdown('Sélectionner Client', ['Option 1', 'Option 2']),
              _buildInputField(_model.textController2, 'Sujet'),
              _buildMultiLineInputField(_model.textController3, 'Description'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('groupChatOptions'),
        backgroundColor: const Color(0xFFF4C534),
        child: const Icon(Icons.check, color: Colors.white),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(label, style: Theme.of(context).textTheme.titleMedium),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            isDense: true,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(label, style: Theme.of(context).textTheme.titleMedium),
        ),
        DropdownButtonFormField<String>(
          value: _model.dropDownValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _model.dropDownValue = newValue;
            });
          },
        ),
      ],
    );
  }

  Widget _buildMultiLineInputField(TextEditingController controller, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(label, style: Theme.of(context).textTheme.titleMedium),
        ),
        TextField(
          controller: controller,
          maxLines: 8,
          minLines: 3,
          decoration: InputDecoration(
            hintText: "Enter text here...",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
