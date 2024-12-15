import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:talentaku_app_guru/models/laporan_preview_event.dart';
import 'package:talentaku_app_guru/widgets/date_picker_card.dart';

class DetailSiswaController extends GetxController{

    final RxList<LaporanPreviewEvent> filteredLaporan =
      <LaporanPreviewEvent>[].obs;


        // Data laporan dan filter properties
  final RxList<LaporanPreviewEvent> histories = <LaporanPreviewEvent>[
    LaporanPreviewEvent(
      title: 'Laporan Harian - Rabu',
      date: '24 November 2024',
      description:
          'Perkembangan motorik halus semakin membaik. Siswa dapat mengikuti instruksi dengan baik dan menyelesaikan kegiatan tepat waktu. Hari ini fokus pada kegiatan menulis dan menggambar.',
    ),
    LaporanPreviewEvent(
      title: 'Laporan Harian - Selasa',
      date: '20 November 2024',
      description:
          'Siswa mengikuti kegiatan belajar dengan antusias. Mampu berinteraksi dengan teman-teman dan menunjukkan sikap yang positif dalam aktivitas kelompok.',
    ),
    LaporanPreviewEvent(
      title: 'Laporan Harian - Senin',
      date: '12 Maret 2024',
      description:
          'Hari ini siswa menunjukkan kemajuan yang baik dalam pembelajaran. Aktif berpartisipasi dalam kegiatan kelas dan mampu menyelesaikan tugas dengan baik. Perlu perhatian lebih pada fokus saat kegiatan membaca.',
    ),
  ].obs;

  final RxString selectedFilter = 'Semua Laporan'.obs;
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final RxList<LaporanPreviewEvent> filteredHistories = <LaporanPreviewEvent>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredHistories.value = histories;
  }

  void filterLaporan(String value) {
    selectedFilter.value = value;
    final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');

    switch (value) {
      case '7 Hari Terakhir':
        final DateTime now = DateTime.now();
        final DateTime sevenDaysAgo = now.subtract(const Duration(days: 7));

        filteredHistories.value = histories.where((laporan) {
          final DateTime laporanDate = format.parse(laporan.date);
          return laporanDate.isAfter(sevenDaysAgo);
        }).toList();
        break;

      default:
        filteredHistories.value = histories;
    }
  }
void showDatePicker(BuildContext context) async {
    final DateTime? picked = await DatePickerCard.show(
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
      onDateSelected: (DateTime date) {
        selectedDate.value = date;
        final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');
        final String selectedDateStr = format.format(date);

        filteredHistories.value = histories
            .where((laporan) => laporan.date == selectedDateStr)
            .toList();
      },
    );
  }
}