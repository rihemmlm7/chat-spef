import 'package:flutter/material.dart';
import 'package:massage/pages/home.dart';
import 'package:massage/pages/styles/login_page_style.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordsMatch = true;
  bool _allFieldsFilled = false;
  String _nameError = '';
  String _prenomError = '';
  String _emailError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkAllFieldsFilled);
    _prenomController.addListener(_checkAllFieldsFilled);
    _emailController.addListener(_checkAllFieldsFilled);
    _passwordController.addListener(_checkAllFieldsFilled);
    _confirmPasswordController.addListener(_checkAllFieldsFilled);
  }

  void _checkAllFieldsFilled() {
    setState(() {
      _allFieldsFilled = _nameController.text.isNotEmpty &&
          _prenomController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty;

      _nameError = '';
      _prenomError = '';
      _emailError = '';
      _passwordError = '';
      _confirmPasswordError = '';
    });
  }

  void _validateAndSignUp() {
    setState(() {
      _nameError =
          _nameController.text.isEmpty ? 'Veuillez entrer votre nom.' : '';
      _prenomError =
          _prenomController.text.isEmpty ? 'Veuillez entrer votre prénom.' : '';
      _emailError = _emailController.text.isEmpty
          ? 'Veuillez entrer votre adresse e-mail.'
          : !EmailValidator.validate(_emailController.text)
              ? 'Veuillez entrer une adresse e-mail valide.'
              : '';
      _passwordError = _passwordController.text.isEmpty
          ? 'Veuillez entrer votre mot de passe.'
          : '';
      _confirmPasswordError = _confirmPasswordController.text.isEmpty
          ? 'Veuillez confirmer votre mot de passe.'
          : '';

      if (_passwordController.text != _confirmPasswordController.text) {
        _passwordError = 'Les mots de passe ne correspondent pas.';
        _confirmPasswordError = 'Les mots de passe ne correspondent pas.';
      }
    });

    if (_allFieldsFilled && _passwordsMatch && _emailError.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: LoginPageStyle.containerDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 70),
                child: Center(
                  child: Text(
                    'Inscrivez-vous',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF2B2B2B),
    
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                decoration: LoginPageStyle.textFieldDecoration(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Text(
                        'Nom',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2B2B2B),
                          
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Entrez votre Nom',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFADADAD),
                            
                          ),
                          errorText: _nameError.isNotEmpty ? _nameError : null,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Prénom',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2B2B2B),
                          
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: _prenomController,
                        decoration: InputDecoration(
                          hintText: 'Entrez votre Prénom',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFADADAD),
                            
                          ),
                          errorText:
                              _prenomError.isNotEmpty ? _prenomError : null,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2B2B2B),
                          
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Entrez votre adresse e-mail',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFADADAD),
                            
                          ),
                          errorText:
                              _emailError.isNotEmpty ? _emailError : null,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Mot de passe',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2B2B2B),
                          
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        obscureText: _obscureText,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Entrez votre mot de passe',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFADADAD),
                            
                          ),
                          errorText:
                              _passwordError.isNotEmpty ? _passwordError : null,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4.4),
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Confirmer mot de passe',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2B2B2B),
                          
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        obscureText: _obscureText,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: 'Confirmez votre mot de passe',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFADADAD),
                            
                          ),
                          errorText: _confirmPasswordError.isNotEmpty
                              ? _confirmPasswordError
                              : null,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4.4),
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 36),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBCA19),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: _validateAndSignUp,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(
                              'S\'inscrire',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Vous avez déjà un compte ?',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Connectez-vous ici',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFBCA19),
                                
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
