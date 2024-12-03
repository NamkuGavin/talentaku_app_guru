import 'package:flutter/material.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';

class TeacherSection extends StatelessWidget {
  const TeacherSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.textLight,
              width: 2,
            ),
            color: AppColors.secondaryLight,
          ),
          child: Icon(
            Icons.school,
            color: AppColors.primary,
            size: AppSizes.iconXL,
          ),
        ),
        SizedBox(width: AppSizes.spaceM),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guru Kelas',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textLight.withOpacity(0.8),
              ),
            ),
            Text(
              'Bu Sekar',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textLight,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
} 