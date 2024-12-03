import 'package:flutter/material.dart';
import 'package:talentaku_app_guru/models/categories_event.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
class CategoriesLine extends StatelessWidget {
  final CategoryEvent categoryEvent;

  const CategoriesLine({
    Key? key,
    required this.categoryEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.categoryLineHeight,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: AppSizes.categoryLineHeight * 0.65,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(AppSizes.radiusS),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: AppSizes.categoryImageSize + AppSizes.paddingXL),
                child: Text(
                  categoryEvent.title,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -AppSizes.categoryLineHeight * 0.5,
            left: AppSizes.paddingXL,
            child: Container(
              width: AppSizes.categoryImageSize,
              height: AppSizes.categoryImageSize,
              padding: EdgeInsets.all(AppSizes.paddingXS),
              child: Image.asset(
                categoryEvent.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
