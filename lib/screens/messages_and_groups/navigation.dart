import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massage/screens/messages_and_groups/widgets/navigation_widgets/floating_action_button.dart';
import 'package:massage/pages/home.dart';
import 'widgets/chat.dart';
import 'widgets/group_chat.dart';
import 'controllers/main_controller.dart';
import 'widgets/navigation_widgets/navigation_buttons.dart';

/// Onboarding screen to introduce users to the app.
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    // Reset the controller state to show "Messages" tab initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.reset();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2A343D)),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          ),
        ),
        title: Obx(() {
          return Text(controller.currentPageIndex.value == 0 ? 'Messages' : 'Groups');
        }),
        elevation: 3,
        shadowColor: Colors.black,
      ),
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              HomePageWidget(),
              GroupsPageWidget(),
            ],
          ),
          const TOnBoardingDotNavigation(),
        ],
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
