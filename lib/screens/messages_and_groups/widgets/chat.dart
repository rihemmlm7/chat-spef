import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white, // Assuming a light grey background
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 80),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    _buildMessageItem(context, index + 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, Widget destination, bool isLight) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isLight ? const Color(0xFFD9D9D9) : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey, // Customizable
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => destination)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily:
                    'Outfit', // Assuming you have this font, or change as needed
                color: Color(0xFF57636C),
                fontSize: 14,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageItem(BuildContext context, int userNumber) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('one-to-one-chat');
      },
      child: ListTile(
        leading: Stack(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  color: const Color(0xFF46F25D),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),
        title: Text('User $userNumber'),
        subtitle: const Text('Message'),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('3m ago'),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xFFE94242),
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: const Text('12', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
