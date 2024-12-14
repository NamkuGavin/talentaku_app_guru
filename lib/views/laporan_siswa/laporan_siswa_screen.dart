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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WelcomeSign(),
              SizedBox(height: AppSizes.spaceXL),

              // Class Cards ListView
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                itemCount: controller.classEvents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.spaceL),
                    child: ClassCard(classEvent: controller.classEvents[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
