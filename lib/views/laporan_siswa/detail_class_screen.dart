import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/controllers/class_detail_controller.dart';
import 'package:talentaku_app_guru/widgets/class_detail_header.dart';
import 'package:talentaku_app_guru/widgets/teacher_section.dart';
import 'package:talentaku_app_guru/widgets/students_grid.dart';

class ClassDetailScreen extends StatelessWidget {
  const ClassDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassDetailController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(AppSizes.paddingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSizes.spaceL),
                    ClassDetailHeader(
                      className: controller.className,
                      classCategory: controller.classCategory,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.radiusXL),
                      topRight: Radius.circular(AppSizes.radiusXL),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AppSizes.paddingXL),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TeacherSection(teacher: controller.teacher),
                            SizedBox(height: AppSizes.spaceXL),
                            Text(
                              'Daftar Siswa',
                              style: AppTextStyles.heading2,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: controller.students.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'images/abc.png',
                                        width: 200,
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        width: 320,
                                        child: Text(
                                          'Belum ada \nSiswa yang bergabung!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF333D6B),
                                            fontSize: 20,
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w600,
                                            height: 1,
                                            letterSpacing: -0.60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : StudentsGrid(
                                students: controller.students,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
