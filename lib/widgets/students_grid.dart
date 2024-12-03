import 'package:flutter/material.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';

class StudentsGrid extends StatelessWidget {
  final List<Map<String, String>> students;

  const StudentsGrid({
    Key? key,
    required this.students,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: AppSizes.spaceM,
          mainAxisSpacing: AppSizes.spaceM,
        ),
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.textLight.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
            ),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  margin: EdgeInsets.all(AppSizes.paddingS),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.textLight,
                      width: 2,
                    ),
                    color: AppColors.secondaryLight,
                  ),
                  child: Icon(
                    Icons.person,
                    color: AppColors.primary,
                    size: AppSizes.iconL,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: AppSizes.paddingS),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          students[index]['name']!,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Siswa',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textLight.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
} 