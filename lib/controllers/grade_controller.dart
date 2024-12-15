import 'package:get/get.dart';
import 'package:talentaku_app_guru/apiservice/api_Service.dart';
import 'package:talentaku_app_guru/models/class_event.dart';

class GradeController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final RxList<ClassEvent> classEvents = <ClassEvent>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchGrades();
  }

  Future<void> fetchGrades() async {
    try {
      isLoading.value = true;
      error.value = '';
      
      final response = await ApiService.getTeacherGrades();
      
      // Map Grade objects to ClassEvent objects
      classEvents.value = response.data.map((grade) => ClassEvent(
        groupName: grade.name,
        ageRange: grade.desc,
        image: 'images/abc.png', 
      )).toList();
      
    } catch (e) {
      error.value = e.toString();
      classEvents.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
