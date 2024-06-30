import 'package:flutter/material.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/Description.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/plus.dart';
import 'package:massage/screens/messages_and_groups/widgets/options/contacts.dart';
import 'package:massage/screens/description_media_discussion/navigation.dart';
import 'package:massage/screens/description_media_discussion/widgets/group_chat_screen.dart';
import 'package:massage/screens/description_media_discussion/widgets/group_media_description_ter.dart';
import 'package:massage/screens/description_media_discussion/widgets/media.dart';
import 'package:massage/screens/messages_and_groups/navigation.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/new_group.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/new_group_detail.dart';
import 'package:massage/screens/messages_and_groups/widgets/options/one_to_one_message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
      routes: {
        'contacts': (context) => const ContactsWidget(),
        'detail': (context) => const NewGroupWidget(),
        'detail2': (context) => const NewGroupDetailWidget(),
        'groupChatScreen': (context) => GroupChatScreen(),
        'chatScreen': (context) => const OnBoardingScreen(),
        'groupMediaDescriptionWidget': (context) =>
            const GroupMediaDescriptionWidget(),
        'groupMediaDescriptionSuit': (context) => PdfListScreen(),
        'groupMedia': (context) => const GroupMediaWidget(),
        'groupChatOptions': (context) => const TOnBoardingNavigationBar(),
        'plusOption': (context) => PlusOption(),
        'one-to-one-chat': (context) => const ChatScreen(),

        // Define the route
      },
    );
  }
}
