import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';

class ClassDetailHeader extends StatelessWidget {
  final String className;
  final String classCategory;

  const ClassDetailHeader({
    Key? key,
    required this.className,
    required this.classCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textLight,
            size: AppSizes.iconL,
          ),
          onPressed: () => Get.back(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              className,
              style: AppTextStyles.heading1.copyWith(
                color: AppColors.textLight,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingM,
                vertical: AppSizes.paddingXS,
              ),
              decoration: BoxDecoration(
                color: AppColors.textLight,
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
              ),
              child: Text(
                classCategory,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primaryDark,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
} 