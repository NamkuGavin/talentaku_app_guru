import 'package:flutter/material.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/constants/app_text_styles.dart';
import 'package:talentaku_app_guru/models/laporan_form_model.dart';
import 'package:talentaku_app_guru/widgets/hasil_option_button.dart';

class LaporanFormSection extends StatelessWidget {
  final String title;
  final List<LaporanFormModel> forms;
  final Function(int, String) onKegiatanChanged;
  final Function(int, String) onHasilChanged;
  final int sectionIndex;

  const LaporanFormSection({
    Key? key,
    required this.title,
    required this.forms,
    required this.onKegiatanChanged,
    required this.onHasilChanged,
    required this.sectionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.heading3,
        ),
        SizedBox(height: AppSizes.spaceM),
        _buildFormList(),
        SizedBox(height: AppSizes.spaceL),
      ],
    );
  }

  Widget _buildFormList() {
    List<Widget> formWidgets = [];
    for (int i = 0; i < forms.length; i++) {
      formWidgets.add(
        Container(
          margin: EdgeInsets.only(bottom: AppSizes.spaceM),
          padding: EdgeInsets.all(AppSizes.paddingM),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
            border: Border.all(color: AppColors.primary),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: forms[i].kegiatan,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Masukkan kegiatan...',
                  hintStyle: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary.withOpacity(0.5),
                  ),
                  errorStyle: AppTextStyles.bodySmall.copyWith(
                    color: Colors.red,
                  ),
                ),
                style: AppTextStyles.bodyMedium,
                maxLines: null,
                validator: (value) {
                  // Make validation required only for first card of Kegiatan Inti
                  // or for other sections
                  if (title != 'Kegiatan Inti' || i == 0) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon isi kegiatan terlebih dahulu';
                    }
                  }
                  return null;
                },
                onChanged: (value) => onKegiatanChanged(i, value),
              ),
              Divider(color: AppColors.primary.withOpacity(0.2)),
              _buildHasilOptions(i),
            ],
          ),
        ),
      );
    }
    return Column(children: formWidgets);
  }

  Widget _buildHasilOptions(int formIndex) {
    return Row(
      children: [
        Text(
          'Hasil:',
          style: AppTextStyles.bodyMedium,
        ),
        SizedBox(width: AppSizes.spaceS),
        Expanded(
          child: HasilOptionButtons(
            selectedHasil: forms[formIndex].hasil,
            onHasilChanged: (value) => onHasilChanged(formIndex, value),
          ),
        ),
      ],
    );
  }
} 