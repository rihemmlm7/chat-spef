import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late AnimationController _imageAnimationController;

  @override
  void initState() {
    super.initState();

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _startAnimations();
  }

  void _startAnimations() {
    _textAnimationController.forward();
    _imageAnimationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    _imageAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgA.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    FadeTransition(
                      opacity: _imageAnimationController,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0, 0),
                          end: Offset(-0.4, 0.01),
                        ).animate(
                          CurvedAnimation(
                            parent: _imageAnimationController,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: Container(
                          width: 140,
                          height: 140,
                          child: Image.asset(
                            'assets/logos/logospef.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _textAnimationController,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0, 0),
                          end: Offset(0.4, -0.01),
                        ).animate(
                          CurvedAnimation(
                            parent: _textAnimationController,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: Container(
                          width: 140,
                          height: 140,
                          alignment: Alignment.center,
                          child: Text(
                            'SPEF',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
