import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/models/class_event.dart';
import 'package:talentaku_app_guru/controllers/navigation_controller.dart';

class HomeClassCard extends StatelessWidget {
  final ClassEvent classEvent;

  const HomeClassCard({
    Key? key,
    required this.classEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final navController = Get.find<NavigationController>();
            navController.changeIndex(1);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingL,
              vertical: AppSizes.paddingM,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.assignment_outlined,
                  color: AppColors.primary,
                  size: AppSizes.iconL,
                ),
                SizedBox(width: AppSizes.spaceM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Klik untuk Melihat Kelas Anda',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Lihat detail kelas ${classEvent.groupName}',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textPrimary.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.primary,
                  size: AppSizes.iconS,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
