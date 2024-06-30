import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/plus.dart';
import 'widgets/options/Description.dart';
import 'widgets/group_chat_screen.dart';
import 'widgets/group_media_description_ter.dart';
import 'widgets/media.dart';
import 'controllers/main_controller.dart';

class TOnBoardingNavigationBar extends StatelessWidget {
  const TOnBoardingNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingControllerGroupOptions());

    void navigateToPlusOption() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PlusOption(),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2A343D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: GestureDetector(
          onTap: navigateToPlusOption,
          child: const Text(
            'Nom de group',
            style: TextStyle(color: Color(0xFF2A343D)),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Action based on selection
              print(result); // This prints the selected option to the console
              handleMenuSelection(context,
                  result); // Replace or expand this function based on your needs
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Modifier le groupe',
                child: Text('Modifier le groupe'),
              ),
              const PopupMenuItem<String>(
                value: 'Supprimer le groupe',
                child: Text('Supprimer le groupe'),
              ),
              const PopupMenuItem<String>(
                value: 'Fremer le groupe',
                child: Text('Fremer le groupe'),
              ),
              const PopupMenuItem<String>(
                value: 'Plus',
                child: Text('Plus'),
              ),
            ],
            icon: const Icon(Icons.more_vert, color: Color(0xFF2A343D)),
          ),
        ],
        elevation: 3,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOnboardingButton(context, 0, controller, 'Fichier'),
                _buildOnboardingButton(context, 1, controller, 'Descution'),
                _buildOnboardingButton(context, 2, controller, 'Media'),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                /// Horizontal Scrollable Pages
                PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.updatePageIndicator,
                  children: [
                    PdfListScreen(),
                    GroupChatScreen(),
                    GroupMediaWidget(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingButton(BuildContext context, int pageIndex,
      OnBoardingControllerGroupOptions controller, String name) {
    return Obx(() {
      bool isSelected = controller.currentPageIndex.value == pageIndex;
      return InkWell(
        onTap: () => controller.navigateToPage(pageIndex),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: isSelected ? 60 : 0,
              color: Colors.yellow[600],
            ),
          ],
        ),
      );
    });
  }

  void handleMenuSelection(BuildContext context, String choice) {
    // This function can handle various actions based on the menu choice
    // Example of navigating or displaying a message
    switch (choice) {
      case 'Modifier le groupe':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const GroupMediaDescriptionWidget(),
        ));
        break;
      case 'Supprimer le groupe':
        showDialog<void>(
          context: context,
          barrierDismissible: false, // User must tap button!
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text(
                'Attention !',
                style: TextStyle(color: Colors.redAccent),
              ),
              content: const Text(
                  'Vous êtes sur le point de supprimer ce groupe de messages. Cette action est irréversible. Voulez-vous continuer ?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Oui'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Dismiss dialog
                  },
                ),
                TextButton(
                  child: const Text('Annuler'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Dismiss dialog
                    // You can perform other actions here after
                  },
                ),
              ],
            );
          },
        );
        break;
      case 'Fremer le groupe':
        showDialog<void>(
          context: context,
          barrierDismissible: false, // User must tap button!
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text(
                'Confirmation !',
                style: TextStyle(color: CupertinoColors.systemYellow),
              ),
              content: const Text(
                  ' Veuillez mettre à jour le statut du groupe et fournir une brève description du sujet de discussion et un résumé '),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GroupMediaDescriptionWidget(),
                    )); // Dismiss dialog
                  },
                ),
                TextButton(
                  child: const Text('Annuler'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Dismiss dialog
                    // You can perform other actions here after 'Yes' is tapped
                  },
                ),
              ],
            );
          },
        );
        break;
      case 'Plus':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlusOption(),
        ));
        break;
      default:
        print('Unknown option: $choice');
    }
  }
}
