import 'package:flutter/material.dart';
import 'package:massage/pages/ResetPasswordPage.dart';
import 'package:massage/pages/signup.dart';
import 'package:massage/pages/home.dart';
import 'package:massage/pages/styles/login_page_style.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _fontSize = 16.0; // Define a variable for font size

  bool _isChecked = false;
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgA.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 200, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 65,
                              height: 59,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(119.5),
                                image: DecorationImage(
                                  image: AssetImage('assets/logos/logospef.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 30,
                            ),
                            Text(
                              'SPEF',
                              style: LoginPageStyle.titleTextStyle().copyWith(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Container(
                        decoration: LoginPageStyle.textFieldDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Connectez-vous',
                                  style: TextStyle(
                                    fontSize: _fontSize, // Use the variable here
                                    color: Color(0xFF2B2B2B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: _fontSize, // Use the variable here
                                  color: Color(0xFF2B2B2B),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Entrez votre adresse e-mail',
                                  hintStyle: TextStyle(
                                    fontSize: _fontSize * 0.8125, // Adjust size proportionally
                                    color: Color(0xFFADADAD),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              Text(
                                'Mot de passe',
                                style: TextStyle(
                                  fontSize: _fontSize, // Use the variable here
                                  color: Color(0xFF2B2B2B),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Entrez votre mot de passe',
                                  hintStyle: TextStyle(
                                    fontSize: _fontSize * 0.8125, // Adjust size proportionally
                                    color: Color(0xFFADADAD),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
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
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 0),
                                        child: Checkbox(
                                          activeColor: Colors.blue,
                                          value: _isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              _isChecked = value ?? false;
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        'Rester connecté ?',
                                        style: TextStyle(
                                          fontSize: _fontSize * 0.6875, // Adjust size proportionally
                                          color: Color(0xFF707070),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResetPasswordPage(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text(
                                        'Mot de passe oublié ?',
                                        style: TextStyle(
                                          fontSize: _fontSize * 0.6875, // Adjust size proportionally
                                          color: Colors.blue,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 38,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFBCA19),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextButton(
                                  onPressed: _isLoading ? null : _handleLogin,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(
                                      'Connexion',
                                      style: TextStyle(
                                        fontSize: _fontSize, // Use the variable here
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 38,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Vous n\'avez pas encore de compte ?',
                                    style: TextStyle(
                                      fontSize: _fontSize * 0.6875, // Adjust size proportionally
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height / 60,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      ' Inscrivez-vous ici',
                                      style: TextStyle(
                                        fontSize: _fontSize * 0.6875, // Adjust size proportionally
                                        color: Color(0xFFFBCA19),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 9,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _isLoading ? _buildLoadingOverlay() : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.white,
          dismissible: false,
        ),
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
        ),
      ],
    );
  }

  void _handleLogin() {
    setState(() {
      _isLoading = true;
    });

    // Simulate login process
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
      setState(() {
        _isLoading = false;
      });
    });
  }
}
