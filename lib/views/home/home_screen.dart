import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/controllers/home_controller.dart';
import 'package:talentaku_app_guru/widgets/welcome_sign.dart';
import 'package:talentaku_app_guru/widgets/laporan_preview_card.dart';
import 'package:talentaku_app_guru/widgets/class_card.dart';
import 'package:talentaku_app_guru/widgets/categories_line.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeSign(),
              SizedBox(height: AppSizes.spaceXL + 5),

              // Kelas Anda Section
              CategoriesLine(categoryEvent: controller.categories[0]),

              // Class Card
              ClassCard(classEvent: controller.classEvents[0]),

              SizedBox(height: AppSizes.spaceXL),

              // Laporan Section
              CategoriesLine(categoryEvent: controller.categories[2]),

              // Laporan Preview Cards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                child: SizedBox(
                  height: AppSizes.laporanCardHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.laporanPreviews.length,
                    itemBuilder: (context, index) {
                      return LaporanPreviewCard(
                        laporan: controller.laporanPreviews[index],
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: AppSizes.spaceXL),
            ],
          ),
        ),
      ),
    );
  }
}
