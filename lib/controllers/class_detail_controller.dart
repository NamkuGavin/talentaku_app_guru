import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talentaku_app_guru/models/class_event.dart';
import 'package:talentaku_app_guru/models/laporan_preview_event.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/widgets/date_picker_card.dart';

class ClassDetailController extends GetxController {
  final String className = 'Kelompok Pelangi';
  final String classCategory = 'Kelompok Bermain 4 Tahun';

  // Dummy data untuk students
  final List<Map<String, String>> students = [
    {
      'name': 'User 1',
      'image': 'images/default_user.png',
    },
    {
      'name': 'User 2',
      'image': 'images/default_user.png',
    },
    {
      'name': 'User 3',
      'image': 'images/default_user.png',
    },
    {
      'name': 'User 5',
      'image': 'images/default_user.png',
    },
    {
      'name': 'User 6',
      'image': 'images/default_user.png',
    },
    {
      'name': 'User 7',
      'image': 'images/default_user.png',
    },
    {
      'name': 'User 8',
      'image': 'images/default_user.png',
    },
    {
      'name': 'User 9',
      'image': 'images/default_user.png',
    },
    {
      'name': 'User 10',
      'image': 'images/default_user.png',
    },
  ];


  


}
