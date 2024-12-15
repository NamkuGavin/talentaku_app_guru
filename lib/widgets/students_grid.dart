import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/views/laporan_siswa/detail_siswa_screen.dart';
import 'package:talentaku_app_guru/apiModels/grade_detail_response.dart';

class StudentsGrid extends StatelessWidget {
  final List<Member> students;

  const StudentsGrid({
    Key? key,
    required this.students,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
      itemCount: students.length,
      separatorBuilder: (context, index) => SizedBox(height: AppSizes.spaceM),
      itemBuilder: (context, index) {
        final student = students[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => DetailSiswaScreen(student: student));
          },
          child: Container(
            padding: EdgeInsets.all(AppSizes.paddingL),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusL),
            ),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: student.photo != null
                        ? DecorationImage(
                            image: NetworkImage(student.photo!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: student.photo == null
                        ? AppColors.primary.withOpacity(0.2)
                        : null,
                  ),
                  child: student.photo == null
                      ? Icon(
                          Icons.person,
                          color: AppColors.primary,
                          size: AppSizes.iconL,
                        )
                      : null,
                ),
                SizedBox(width: AppSizes.spaceM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.username,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Text(
                        student.fullname,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}