import 'package:flutter/material.dart';

class GroupsPageWidget extends StatefulWidget {
  const GroupsPageWidget({super.key});

  @override
  State<GroupsPageWidget> createState() => _GroupsPageWidgetState();
}

class _GroupsPageWidgetState extends State<GroupsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white, // Standard light grey background
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 80),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _buildGroupItem(context, index + 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget destination, bool isLight) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isLight ? const Color(0xFFD9D9D9) : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey, // Adjustable border color
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Outfit', // Assuming font family or customize as needed
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

  Widget _buildGroupItem(BuildContext context, int groupNumber) {
    return InkWell(
      onTap: () {
      Navigator.of(context).pushNamed('groupChatOptions');
      },
      child: ListTile(
        leading: Stack(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/multiple-users-silhouette.png'),
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
        title: Text('Group Name $groupNumber'),
        subtitle: const Text('Message'),
        trailing: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Résolu', style: TextStyle(color: Color(0xFF39D2C0))),
            Text('30/09/2024'),
          ],
        ),
      ),
    );
  }
}
