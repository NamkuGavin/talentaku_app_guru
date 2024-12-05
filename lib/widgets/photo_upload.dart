import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';
import '../controllers/create_laporan_controller.dart';

class PhotoUpload extends StatelessWidget {
  final Function(String) onChanged;

  const PhotoUpload({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Unggah Foto',
          style: AppTextStyles.heading3,
        ),
        SizedBox(height: AppSizes.spaceM),
        Container(
          padding: EdgeInsets.all(AppSizes.paddingM),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
            border: Border.all(color: AppColors.primary),
          ),
          child: GetBuilder<CreateLaporanController>(
            init: CreateLaporanController(student: {}),
            builder: (controller) {
              return TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Paste link drive...',
                  errorText: controller.isValidLink
                      ? null
                      : 'Link harus merupakan Google Drive!',
                ),
                onChanged: (value) {
                  controller.validateLink(value);
                  onChanged(value);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
