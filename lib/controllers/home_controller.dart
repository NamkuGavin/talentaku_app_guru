import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/apiModels/program_model.dart';
import 'package:talentaku_app_guru/apiModels/user_model.dart';
import 'package:talentaku_app_guru/apiservice/api_Service.dart';
import 'package:talentaku_app_guru/models/broadcast_event.dart';
import 'package:talentaku_app_guru/models/categories_event.dart';
import 'package:talentaku_app_guru/models/class_event.dart';
import 'package:talentaku_app_guru/models/laporan_preview_event.dart';

class HomeController extends GetxController {

  var informationList = <Program>[].obs;
  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    fetchInformation();
    fetchUserProfile();

  }

  void fetchInformation() async {
    try {
      isLoading(true);
      final apiService = ApiService();
      final programs = await apiService.fetchPrograms();
      informationList.assignAll(programs);
    } catch (e) {
      print('Error fetching programs: $e');
      Get.snackbar(
        'Error',
        'Failed to load programs',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  void addProgram(String name, String desc, String photo) async {
  try {
    isLoading(true);
    await ApiService.createProgram(name, desc, photo);
    fetchInformation(); // Menyegarkan daftar program
  } catch (e) {
    print('Error adding program: $e');
    Get.snackbar(
      'Error',
      'Failed to add program',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  } finally {
    isLoading(false);
  }
}


  void fetchUserProfile() async {
    try {
      isLoading(true);
      final userProfile = await ApiService.fetchUserProfile();
      user.value = userProfile; 
    } catch (e) {
      print('Error fetching user profile: $e');
      Get.snackbar(
        'Error',
        'Failed to load user profile',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  String get userName => user.value?.username ?? 'Guest';
  String get roles {
  if (user.value?.roles.isNotEmpty ?? false) {
    return user.value!.roles.first; 
  }
  return 'Guest'; 
  }




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
      image: 'images/boy1.png',
    ),

    CategoryEvent(
      title: 'Program Tambahan',
      image: 'images/boy2.png',
    ),

  ];




  List<Map<String, dynamic>> schoolFeatures = [
    {
      'title': 'Aktivitas di Rumah',
      'icon': Icons.home_outlined,
      'color': Color(0xFF00C853),
    },
    {
      'title': 'Program Sekolah',

      'icon': Icons.school_outlined,
      'color': Color(0xFFFF6B6B),
    },
    {
      'title': 'Pengumuman & Agenda',
      'icon': Icons.campaign_outlined,
      'color': Color(0xFFFFA726),
    },

        {
      'title': 'Notifikasi Tugas',
      'icon': Icons.notifications_outlined,
      'color': Color(0xFF87CEEB),
    },
  ];




}
