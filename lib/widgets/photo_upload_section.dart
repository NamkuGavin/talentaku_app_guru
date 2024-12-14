import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/controllers/create_laporan_controller.dart';

class PhotoUploadSection extends StatelessWidget {
  const PhotoUploadSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateLaporanController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Link Foto (Opsional)',
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSizes.spaceS),
        Container(
          padding: EdgeInsets.all(AppSizes.paddingM),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
            border: Border.all(color: AppColors.primary),
          ),
          child: TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Paste link foto...',
            ),
            onChanged: (value) => controller.updatePhotoUrl(value),
          ),
        ),
      ],
    );
  }
}
