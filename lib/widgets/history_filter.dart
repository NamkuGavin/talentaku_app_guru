import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';

class HistoryFilter extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;
  final Function(BuildContext) onDatePickerShow;

  const HistoryFilter({
    Key? key,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.onDatePickerShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingM,
        vertical: AppSizes.paddingXS,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),
      child: PopupMenuButton<String>(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.filter_list,
              color: AppColors.primary,
              size: AppSizes.iconM,
            ),
            SizedBox(width: AppSizes.spaceXS),
            Text(
              selectedFilter,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        itemBuilder: (context) => [
          'Semua Laporan',
          '7 Hari Terakhir',
          'Pilih Tanggal',
        ].map((String value) {
          return PopupMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onSelected: (value) {
          if (value == 'Pilih Tanggal') {
            onDatePickerShow(context);
          } else {
            onFilterChanged(value);
          }
        },
      ),
    );
  }
} 