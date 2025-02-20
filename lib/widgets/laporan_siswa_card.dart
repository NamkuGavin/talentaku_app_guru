import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/models/laporan_preview_event.dart';
import 'package:talentaku_app_guru/views/laporan_siswa/detail_laporan_screen.dart';

class LaporanSiswaCard extends StatelessWidget {
  final LaporanPreviewEvent laporan;
  final int index;

  const LaporanSiswaCard({
    Key? key,
    required this.laporan,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => const DetailLaporanScreen(),
        arguments: {
          'id': 'laporan_${index + 1}',
          'date': laporan.date,
        },
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: AppSizes.paddingL),
        padding: EdgeInsets.all(AppSizes.paddingL),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.paddingM),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
              ),
              child: Icon(
                Icons.description_outlined,
                color: AppColors.primary,
                size: AppSizes.iconL,
              ),
            ),
            SizedBox(width: AppSizes.paddingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    laporan.title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSizes.paddingXS),
                  Text(
                    laporan.description,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary.withOpacity(0.7),
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSizes.paddingS),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: AppSizes.iconS,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: AppSizes.paddingXS),
                      Text(
                        laporan.date,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
