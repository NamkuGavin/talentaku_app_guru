import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/controllers/home_controller.dart';
import 'package:talentaku_app_guru/widgets/welcome_sign.dart';
import 'package:talentaku_app_guru/widgets/laporan_preview_card.dart';
import 'package:talentaku_app_guru/widgets/categories_line.dart';
import 'package:talentaku_app_guru/widgets/feature_card.dart';
import 'package:talentaku_app_guru/widgets/home_class_card.dart';

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
              SizedBox(height: AppSizes.spaceXL),

              // Kelas Anda Section
              CategoriesLine(categoryEvent: controller.categories[0]),
              HomeClassCard(classEvent: controller.classEvents[0]),
              
              SizedBox(height: AppSizes.spaceXL),

              // Fitur Aplikasi Section
              CategoriesLine(categoryEvent: controller.categories[1]),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppSizes.spaceM,
                    mainAxisSpacing: AppSizes.spaceM,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: controller.schoolFeatures.length,
                  itemBuilder: (context, index) {
                    final feature = controller.schoolFeatures[index];
                    return FeatureCard(
                      title: feature['title'],
                      description: feature['description'],
                      icon: feature['icon'],
                      color: feature['color'],
                    );
                  },
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
