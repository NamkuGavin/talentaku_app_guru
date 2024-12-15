import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/models/class_event.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_decorations.dart';
import 'package:talentaku_app_guru/views/laporan_siswa/detail_class_screen.dart';

class ClassCard extends StatelessWidget {
  final ClassEvent classEvent;

  const ClassCard({
    Key? key,
    required this.classEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ClassDetailScreen()),
      child: Container(
        width: double.infinity,
        height: AppSizes.classCardHeight,
        margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: AppSizes.classCardHeight,
              decoration: AppDecorations.classCardDecoration,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppSizes.paddingXL,
                  right: AppSizes.classImageSize + AppSizes.paddingXL,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classEvent.groupName,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: AppSizes.paddingXS),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_sharp,
                          size: AppSizes.iconS,
                          color: AppColors.primaryDark,
                        ),
                        SizedBox(width: AppSizes.paddingXS),
                        Text(
                          classEvent.ageRange,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: AppSizes.paddingL,
              top: AppSizes.paddingL,
              child: Container(
                width: AppSizes.classImageSize,
                height: AppSizes.classImageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(classEvent.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
