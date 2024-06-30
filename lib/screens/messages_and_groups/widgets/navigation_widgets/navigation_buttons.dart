import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/main_controller.dart';

class TOnBoardingDotNavigation extends StatelessWidget {
  const TOnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController
        .instance; // Make sure this is correctly defined somewhere

    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        child: _buildToggleButtons(context, controller),
      ),
    );
  }

  Widget _buildToggleButtons(
      BuildContext context, OnBoardingController controller) {
    return Center(
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
          child: Container(
            width: 309,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(80),
              border: Border.all(
                color: const Color(0xFFD9D9D9),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOnboardingButton(context, 0, controller, 'Messages'),
                  _buildOnboardingButton(context, 1, controller, 'Groups'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingButton(BuildContext context, int pageIndex,
      OnBoardingController controller, String name) {
    return Expanded(
      child: InkWell(
        onTap: () => controller.navigateToPage(pageIndex),
        child: Obx(() {
          // Wrap the Container with Obx() to listen for changes
          return Container(
            decoration: BoxDecoration(
              color: controller.currentPageIndex.value == pageIndex
                  ? Colors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(80),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: controller.currentPageIndex.value == pageIndex
                      ? Colors.black
                      : const Color(0xFF4f4f4f),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
