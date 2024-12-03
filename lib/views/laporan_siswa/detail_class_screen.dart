import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/controllers/class_detail_controller.dart';
import 'package:talentaku_app_guru/views/laporan_siswa/create_laporan_screen.dart';
import 'package:talentaku_app_guru/widgets/class_detail_header.dart';
import 'package:talentaku_app_guru/widgets/teacher_section.dart';
import 'package:talentaku_app_guru/widgets/students_grid.dart';
import 'package:talentaku_app_guru/widgets/history_filter.dart';
import 'package:talentaku_app_guru/widgets/laporan_siswa_card.dart';
import 'package:talentaku_app_guru/widgets/create_report_button.dart';
import 'package:talentaku_app_guru/widgets/student_picker_sheet.dart';

class ClassDetailScreen extends StatelessWidget {
  const ClassDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassDetailController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      floatingActionButton: CreateReportButton(
        onPressed: () => _showStudentPicker(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.paddingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClassDetailHeader(
                    className: controller.className,
                    classCategory: controller.classCategory,
                  ),
                  SizedBox(height: AppSizes.spaceL),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TeacherSection(),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: AppSizes.spaceM),
                          child: Divider(
                            color: AppColors.textLight.withOpacity(0.2),
                            thickness: 1,
                          ),
                        ),
                        Text(
                          'Daftar Siswa',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textLight.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: AppSizes.spaceM),
                        StudentsGrid(students: controller.students),
                      ],
                    ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'History Anda',
                            style: AppTextStyles.heading3.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Obx(() => HistoryFilter(
                                selectedFilter: controller.selectedFilter.value,
                                onFilterChanged: controller.filterLaporan,
                                onDatePickerShow: controller.showDatePicker,
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(() => ListView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.paddingXL,
                            ),
                            itemCount: controller.filteredHistories.length,
                            itemBuilder: (context, index) {
                              return LaporanSiswaCard(
                                laporan: controller.filteredHistories[index],
                                index: index,
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showStudentPicker(BuildContext context) {
    final controller = Get.find<ClassDetailController>();
    Get.bottomSheet(
      StudentPickerSheet(students: controller.students),
      isScrollControlled: true,
    );
  }
}
