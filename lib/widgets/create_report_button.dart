import 'package:flutter/material.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';

class CreateReportButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateReportButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: AppSizes.paddingXL,
        bottom: AppSizes.paddingXL,
      ),
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: AppColors.secondary,
        elevation: 4,
        icon: Icon(
          Icons.add_circle_outline,
          color: AppColors.textLight,
        ),
        label: Text(
          'Buat Laporan',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textLight,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
} 