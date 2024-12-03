import 'package:flutter/material.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';

class CatatanSection extends StatelessWidget {
  final Function(String) onChanged;

  const CatatanSection({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catatan',
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
          child: TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Tambahkan catatan...',
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
} 