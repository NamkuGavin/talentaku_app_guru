import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_decorations.dart';
import '../controllers/home_controller.dart';
import '../views/notification/notification_screen.dart';

class WelcomeSign extends StatelessWidget {
  const WelcomeSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.radiusXXL),
          bottomRight: Radius.circular(AppSizes.radiusXXL),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: AppSizes.welcomeSignHeight,
        margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
        child: Row(
          children: [
            // Logo
            Container(
              width: AppSizes.logoSize,
              height: AppSizes.logoSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/logo.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(width: AppSizes.paddingXL),

            // Welcome Text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang,',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textLight,
                    ),
                  ),
                  Obx(() => Text(
                    controller.userName,
                    style: AppTextStyles.heading1.copyWith(
                      color: AppColors.textLight,
                    ),
                  )),
                 
                ],
              ),
            ),

            // Notification Button
            GestureDetector(
              onTap: () => Get.to(() => const NotificationScreen()),
              child: Container(
                width: AppSizes.notificationIconSize,
                height: AppSizes.notificationIconSize,
                decoration: AppDecorations.notificationButtonDecoration,
                child: Icon(
                  Icons.notifications,
                  size: AppSizes.iconL,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
