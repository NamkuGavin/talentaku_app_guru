import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:talentaku_app_guru/apiservice/api_Service.dart';
import 'package:talentaku_app_guru/apiModels/grade_detail_response.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/widgets/date_picker_card.dart';

class ClassDetailController extends GetxController {
  final Rx<GradeDetail?> gradeDetail = Rx<GradeDetail?>(null);
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final int gradeId = Get.arguments ?? 1;
    fetchGradeDetail(gradeId);
  }

  Future<void> fetchGradeDetail(int gradeId) async {
    try {
      isLoading.value = true;
      error.value = '';
      final response = await ApiService.getGradeDetail(gradeId);
      gradeDetail.value = response.data;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  String get className => 'Kelompok ${gradeDetail.value?.name ?? 'Loading...'}';
  String get classCategory => gradeDetail.value?.desc ?? '';
  List<Member> get students => gradeDetail.value?.members ?? [];
  String? get teacher => gradeDetail.value?.teacher;
}
