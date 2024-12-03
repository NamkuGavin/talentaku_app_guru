import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/controllers/home_controller.dart';
import 'package:talentaku_app_guru/widgets/welcome_sign.dart';
import 'package:talentaku_app_guru/widgets/class_card.dart';

class LaporanSiswaScreen extends StatelessWidget {
  const LaporanSiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const WelcomeSign(),
            SizedBox(height: AppSizes.spaceXL),

            // Class Card
            ClassCard(classEvent: controller.classEvents[0]),
          ],
        ),
      ),
    );
  }
}
