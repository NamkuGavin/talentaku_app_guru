import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/models/info_popup_event.dart';
import 'package:talentaku_app_guru/widgets/info_popup.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const FeatureCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    this.color = const Color(0xFF6C63FF),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(
          InfoPopup(
            popupEvent: InfoPopupEvent(
              title: 'Fitur dalam Pengembangan',
              message: 'Fitur ini sedang dalam tahap pengembangan. Silakan tunggu update selanjutnya!',
              icon: Icons.construction,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(AppSizes.paddingL),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.paddingM),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
              ),
              child: Icon(
                icon,
                color: color,
                size: AppSizes.iconXL,
              ),
            ),
            SizedBox(height: AppSizes.spaceM),
            Text(
              title,
              style: AppTextStyles.heading3,
            ),
            SizedBox(height: AppSizes.spaceXS),
            Text(
              description,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary.withOpacity(0.7),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
