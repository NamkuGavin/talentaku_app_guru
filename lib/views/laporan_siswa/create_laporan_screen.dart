import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/controllers/create_laporan_controller.dart';
import 'package:talentaku_app_guru/widgets/date_semester_row.dart';
import 'package:talentaku_app_guru/widgets/laporan_form_section.dart';
import 'package:talentaku_app_guru/widgets/catatan_section.dart';
import 'package:talentaku_app_guru/widgets/photo_upload_section.dart';
import 'package:talentaku_app_guru/widgets/submit_button.dart';
import 'package:talentaku_app_guru/widgets/info_popup.dart';

class CreateLaporanScreen extends StatelessWidget {
  final Map<String, String> student;

  const CreateLaporanScreen({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateLaporanController(student: student));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Buat Laporan Harian',
          style: AppTextStyles.heading3,
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.paddingXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => DateSemesterRow(
                    formattedDate: controller.formattedDate,
                    selectedSemester: controller.selectedSemester.value,
                    semesters: controller.semesters,
                    onDateChanged: controller.updateDate,
                    onSemesterChanged: controller.updateSemester,
                    selectedDate: controller.selectedDate.value,
                  )),
              SizedBox(height: AppSizes.spaceL),
              _buildSections(controller),
              SizedBox(height: AppSizes.spaceL),
              CatatanSection(
                onChanged: (value) => controller.catatan.value = value,
              ),
              SizedBox(height: AppSizes.spaceL),
              PhotoUploadSection(),
              SizedBox(height: AppSizes.spaceXL),
              SubmitButton(
                onPressed: () => _showConfirmationDialog(context, controller),
                text: 'Kirim Laporan',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSections(CreateLaporanController controller) {
    List<Widget> sectionWidgets = [];
    for (int i = 0; i < controller.sections.length; i++) {
      sectionWidgets.add(
        Obx(() => LaporanFormSection(
              title: controller.sections[i].title,
              forms: controller.sections[i].forms,
              onKegiatanChanged: (formIndex, value) =>
                  controller.updateKegiatan(i, formIndex, value),
              onHasilChanged: (formIndex, value) =>
                  controller.updateHasil(i, formIndex, value),
              sectionIndex: i,
            )),
      );
    }
    return Column(children: sectionWidgets);
  }

  void _showConfirmationDialog(
      BuildContext context, CreateLaporanController controller) {
    InfoPopup.show(
      title: 'Konfirmasi Pengiriman',
      message: 'Apakah Anda yakin ingin mengirim laporan ini?\nPastikan semua data telah terisi dengan benar.',
      icon: Icons.help_outline,
      iconColor: AppColors.secondary,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: AppSizes.spaceM),
              child: TextButton(
                onPressed: () => Get.back(),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingXL,
                    vertical: AppSizes.paddingM,
                  ),
                ),
                child: Text(
                  'Batal',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                controller.submitLaporan();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingXL,
                  vertical: AppSizes.paddingM,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
              ),
              child: Text(
                'Ya, Kirim',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
