import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/controllers/login_controller.dart';

class PhotoUploadSection extends StatelessWidget {
  const PhotoUploadSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Unggah Foto',
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSizes.spaceS),

        GestureDetector(
          onTap: () async {
            await controller.pickMultipleImages(context);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppSizes.paddingM),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              border: Border.all(color: AppColors.primary),
            ),
            child: Center(
              child: Icon(
                Icons.photo_camera,
                size: AppSizes.iconXL,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        SizedBox(height: AppSizes.spaceM),
        Obx(() {
          if (controller.uploadedImages.isEmpty) {
            return Text(
              'Belum ada foto yang diunggah.',
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.primary),
            );
          } else {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: AppSizes.spaceXS,
                mainAxisSpacing: AppSizes.spaceXS,
              ),
              itemCount: controller.uploadedImages.length,
              itemBuilder: (context, index) {
                final imagePath = controller.uploadedImages[index];
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.radiusS),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizes.radiusS),
                        child: Image.file(
                          File(imagePath),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => controller.removeImage(index),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        }),
      ],
    );
  }
}
