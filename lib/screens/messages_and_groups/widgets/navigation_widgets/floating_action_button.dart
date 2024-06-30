import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/main_controller.dart';


class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance; // Make sure this is correctly defined somewhere

    return  Obx(
      (){
        return FloatingActionButton(
        onPressed: controller.currentPageIndex.value == 0 ? () => Navigator.of(context).pushNamed('contacts') : () => Navigator.of(context).pushNamed('detail'),
        backgroundColor: const Color(0xFFF4C534),
        child:controller.currentPageIndex.value == 0 ?  const Icon(Icons.person_add, color: Colors.white):const Icon(Icons.group_add, color: Colors.white),
      );}
    );
  }
}
