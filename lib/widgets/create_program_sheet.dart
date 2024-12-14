import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';

class CreateProgramSheet extends StatelessWidget {
  final Function(String name, String desc, File? photo) onSubmit;

  const CreateProgramSheet({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    File? selectedPhoto;

    return Container(
      width: double.infinity,
      height: AppSizes.bottomSheetHeight,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header dengan garis dan judul
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8, bottom: 18),
            child: Column(
              children: [
                Container(
                  width: AppSizes.bottomSheetIndicatorWidth,
                  height: AppSizes.bottomSheetIndicatorHeight,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDEDEDE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceXL),
                Text(
                  'Buat Program',
                  style: AppTextStyles.heading2.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                child: Column(
                  children: [
                    // Image
                  
                    SizedBox(height: AppSizes.spaceXL),
                    // Tampilkan deskripsi
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: AppSizes.paddingXL),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Program',
                            style: AppTextStyles.heading3,
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSizes.spaceM),
                          Text(
                            'Deskripsi',
                            style: AppTextStyles.heading3,
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            controller: descController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceS),
                    ElevatedButton.icon(
                      onPressed: () async {
                        // Image Picker implementation
                        final pickedImage =
                            await ImagePicker().pickImage(source: ImageSource.gallery);
                        if (pickedImage != null) {
                          selectedPhoto = File(pickedImage.path);
                        }
                      },
                      icon: const Icon(Icons.photo),
                      label: const Text('Pilih Foto'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingXL,
              vertical: AppSizes.paddingL,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                onSubmit(
                  nameController.text,
                  descController.text,
                  selectedPhoto,
                );
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF4F4F4),
                minimumSize: Size(double.infinity, AppSizes.bottomSheetButtonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
              ),
              child: Text(
                'Submit',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}