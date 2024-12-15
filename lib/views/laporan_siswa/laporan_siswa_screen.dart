import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app_guru/constants/app_colors.dart';
import 'package:talentaku_app_guru/constants/app_sizes.dart';
import 'package:talentaku_app_guru/controllers/grade_controller.dart';
import 'package:talentaku_app_guru/widgets/welcome_sign.dart';
import 'package:talentaku_app_guru/widgets/class_card.dart';

class LaporanSiswaScreen extends StatelessWidget {
  const LaporanSiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GradeController controller = Get.put(GradeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WelcomeSign(),
              SizedBox(height: AppSizes.spaceXL),

              // Class Cards ListView
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (controller.error.value.isNotEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'Error: ${controller.error.value}',
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => controller.fetchGrades(),
                            child: Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (controller.classEvents.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('No classes found'),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                  itemCount: controller.classEvents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.spaceL),
                      child: ClassCard(
                        classEvent: controller.classEvents[index],
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
