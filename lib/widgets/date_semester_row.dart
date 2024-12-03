import 'package:flutter/material.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/widgets/date_picker_card.dart';

class DateSemesterRow extends StatelessWidget {
  final String formattedDate;
  final String selectedSemester;
  final List<String> semesters;
  final Function(DateTime) onDateChanged;
  final Function(String?) onSemesterChanged;
  final DateTime selectedDate;

  const DateSemesterRow({
    Key? key,
    required this.formattedDate,
    required this.selectedSemester,
    required this.semesters,
    required this.onDateChanged,
    required this.onSemesterChanged,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final DateTime? picked = await DatePickerCard.show(
                initialDate: selectedDate,
                firstDate: DateTime(2024),
                lastDate: DateTime.now(),
                onDateSelected: onDateChanged,
              );
              if (picked != null) {
                onDateChanged(picked);
              }
            },
            child: Container(
              height: 40,
              padding: EdgeInsets.all(AppSizes.paddingM),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                border: Border.all(color: AppColors.primary),
              ),
              child: Text(
                formattedDate,
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ),
        ),
        SizedBox(width: AppSizes.spaceM),
        Expanded(
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              border: Border.all(color: AppColors.primary),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedSemester,
                items: semesters.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onSemesterChanged,
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
} 