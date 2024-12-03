import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class ReusableButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isFullWidth;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  const ReusableButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.icon,
    this.isFullWidth = true,
    this.height = AppSizes.detailHeaderRadius,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth
          ? double.infinity
          : null, // This is controlled by the parent widget
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.secondary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusXL),
          ),
          minimumSize: Size(0, height),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyle(
                color: textColor ?? AppColors.textLight,
                fontSize: fontSize ?? 18,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: AppSizes.paddingS),
              Icon(icon, color: textColor ?? AppColors.textLight, size: 20),
            ]
          ],
        ),
      ),
    );
  }
}
