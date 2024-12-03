import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/views/laporan_siswa/create_laporan_screen.dart';

class StudentList extends StatelessWidget {
  final List<Map<String, String>> students;

  const StudentList({
    Key? key,
    required this.students,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> studentWidgets = [];
    for (var student in students) {
      studentWidgets.add(StudentListItem(student: student));
    }
    return Column(children: studentWidgets);
  }
}

class StudentListItem extends StatelessWidget {
  final Map<String, String> student;

  const StudentListItem({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
        Get.to(() => CreateLaporanScreen(student: student));
      },
      child: Container(
        padding: EdgeInsets.all(AppSizes.paddingL),
        margin: EdgeInsets.only(bottom: AppSizes.paddingM),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: AppSizes.iconL,
              backgroundColor: AppColors.secondaryLight,
              child: Icon(
                Icons.person,
                color: AppColors.primary,
                size: AppSizes.iconL,
              ),
            ),
            SizedBox(width: AppSizes.spaceM),
            Text(
              student['name']!,
              style: AppTextStyles.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
} 