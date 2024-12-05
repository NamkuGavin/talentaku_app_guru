import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/models/broadcast_event.dart';
import 'package:talentaku_app_guru/models/categories_event.dart';
import 'package:talentaku_app_guru/models/class_event.dart';
import 'package:talentaku_app_guru/models/laporan_preview_event.dart';
import 'package:talentaku_app_guru/controllers/laporan_siswa_controller.dart';

class HomeController extends GetxController {
  String userName = 'Khalisha';
  late LaporanSiswaController laporanController;

  List<Event> events = [
    Event(name: 'Hari Kemerdekaan', date: '17 Agustus 2024'),
    Event(name: 'Upacara Hari Pahlawan', date: '10 November 2024'),
    Event(name: 'Hari guru', date: '25 November 2024'),
  ];

  List<CategoryEvent> categories = [
    CategoryEvent(
      title: 'Kelas Anda',
      image: 'images/boy1.png',
    ),
    CategoryEvent(
      title: 'Fitur Tambahan',
      image: 'images/boy2.png',
    ),

  ];

  List<ClassEvent> classEvents = [
    ClassEvent(
      groupName: 'Kelompok Pelangi',
      ageRange: '2 - 3 Tahun',
      image: 'images/abc.png',
    ),
  ];


  List<Map<String, dynamic>> schoolFeatures = [
    {
      'title': 'Laporan Progress Siswa',
      'description': 'Pantau perkembangan siswa secara real-time dengan laporan digital yang mudah diakses',
      'icon': Icons.assessment_outlined,
      'color': Color(0xFF6C63FF),
    },
    {
      'title': 'Aktivitas di Rumah',
      'description': 'Aktivitas edukatif yang menyenangkan untuk dilakukan bersama orang tua di rumah',
      'icon': Icons.home_outlined,
      'color': Color(0xFF00C853),
    },
    {
      'title': 'Program Sekolah',
      'description': 'Informasi lengkap tentang layanan dan program tambahan sekolah',
      'icon': Icons.school_outlined,
      'color': Color(0xFFFF6B6B),
    },
    {
      'title': 'Pengumuman & Agenda',
      'description': 'Dapatkan informasi terkini tentang kegiatan dan agenda sekolah',
      'icon': Icons.campaign_outlined,
      'color': Color(0xFFFFA726),
    },
  ];

  // Getter untuk mendapatkan 3 laporan terbaru
  List<LaporanPreviewEvent> get laporanPreviews {
    laporanController = Get.find<LaporanSiswaController>();
    // Mengambil 3 laporan terbaru dari LaporanSiswaController
    return laporanController.filteredLaporan.take(3).toList();
  }

  @override
  void onInit() {
    super.onInit();
    // Memastikan LaporanSiswaController sudah diinisialisasi
    if (!Get.isRegistered<LaporanSiswaController>()) {
      Get.put(LaporanSiswaController());
    }
  }

  void updateUserName(String newName) {
    userName = newName;
    update();
  }
}
