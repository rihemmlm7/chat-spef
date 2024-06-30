import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/comun_widgets/setting_title.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/plus_options/autorisations.dart';
import 'package:massage/screens/description_media_discussion/widgets/options/plus_options/chage_group_name.dart';

class SettingsController extends GetxController {
  var chatLockEnabled = false.obs;
}

class SettingsScreen extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingTile(
          icon: Icons.edit_attributes_outlined,
          suffixIcon: Icons.edit,
          title: 'Statut',
          subtitle: 'En cours',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GroupNameInputScreen(
                title: 'Saisir le statut',
                lable: 'Le statut',
              ),
            ));
          },
        ),
        SettingTile(
          icon: Icons.admin_panel_settings_rounded,
          suffixIcon: Icons.edit,
          title: 'Admin',
          subtitle: 'Nom d\'admin',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GroupNameInputScreen(
                title: 'Saisir le nom de admin',
                lable: 'Admin',
              ),
            ));
          },
        ),
        /*Obx(
          () => SettingTile(
            icon: Icons.lock_outline,
            title: 'Verrouillage des discussions',
            subtitle:
                'Verrouillez et masquez cette discussion sur cet appareil.',
            trailing: Switch(
              value: settingsController.chatLockEnabled.value,
              onChanged: (value) {
                settingsController.chatLockEnabled.value = value;
              },
            ),
            onTap: () {
              // Handle on tap
            },
          ),
        ), */
        SettingTile(
          icon: Icons.edit_document,
          suffixIcon: Icons.edit,
          title: 'Description',
          subtitle: 'Groupe pour résoudre le problème de client',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GroupNameInputScreen(
                title: 'Donner une description',
                lable: 'Description',
              ),
            ));
          },
        ),
        SettingTile(
          icon: Icons.file_open,
          suffixIcon: Icons.edit,
          title: 'Résumé',
          subtitle: 'Le groupe a été fermé et le problème n\'a pas été résolu',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GroupNameInputScreen(
                title: 'Donner un résumé',
                lable: 'résumé',
              ),
            ));
          },
        ),
        SettingTile(
          icon: Icons.settings,
          title: 'Autorisations du groupe',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => GroupPermissionsScreen(),
            ));
          },
          hasShadow: true,
        ),
      ],
    );
  }
}
