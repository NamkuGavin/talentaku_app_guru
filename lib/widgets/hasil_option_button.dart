import 'package:flutter/material.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/models/laporan_form_model.dart';

class HasilOptionButtons extends StatelessWidget {
  final String selectedHasil;
  final Function(String) onHasilChanged;

  const HasilOptionButtons({
    Key? key,
    required this.selectedHasil,
    required this.onHasilChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> optionButtons = [];
    
    for (String option in LaporanSection.hasilOptions) {
      final bool isSelected = selectedHasil == option;
      optionButtons.add(
        Expanded(
          child: GestureDetector(
            onTap: () => onHasilChanged(option),
            child: Container(
              margin: EdgeInsets.only(right: AppSizes.paddingXS),
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.paddingS,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primary.withOpacity(0.3),
                ),
              ),
              child: Text(
                option,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                  color: isSelected ? AppColors.textLight : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      );
    }
    
    return Row(children: optionButtons);
  }
} 