import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/controllers/detail_siswa_controller.dart';
import 'package:talentaku_app_guru/widgets/history_filter.dart';
import 'package:talentaku_app_guru/widgets/laporan_siswa_card.dart';
import 'package:talentaku_app_guru/widgets/create_report_button.dart';
import 'package:talentaku_app_guru/views/laporan_siswa/create_laporan_screen.dart';
import 'package:talentaku_app_guru/apiModels/grade_detail_response.dart';

class DetailSiswaScreen extends StatelessWidget {
  final Member student;
  
  const DetailSiswaScreen({
    Key? key,
    required this.student,
  }) : super(key: key);

  Map<String, String> get studentMap => {
    'name': student.fullname,
    'username': student.username,
    'photo': student.photo ?? '',
  };

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailSiswaController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      floatingActionButton: CreateReportButton(
        onPressed: () => Get.to(() => CreateLaporanScreen(student: studentMap)),
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
                  // Back button and title
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.textLight,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      Text(
                        'Laporan ${student.fullname}',
                        style: AppTextStyles.heading2.copyWith(
                          color: AppColors.textLight,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
                            'History Laporan',
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
}