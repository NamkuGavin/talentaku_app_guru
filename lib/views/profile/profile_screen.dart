import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_colors.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_text_pair.dart';
import '../../widgets/login_button.dart';
import '../../widgets/profile_image.dart';
import '../../widgets/profile_widgets.dart';
import '../../widgets/welcome_sign.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    final loginController = Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            // const WelcomeSign(),
            const SizedBox(height: AppSizes.spaceXL * 1),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // ProfileImagePicker
                      Obx(() => ProfileImagePicker(
                        model: loginController.getProfileImagePickerModel(context),
                      )),

                      const SizedBox(height: AppSizes.spaceXS),

                      CustomTextPairWidget(
                        model: loginController.getCustomTextPair(),
                      ),

                      const SizedBox(height: AppSizes.spaceXS),

                      // NIS dan Kelompok dalam Column
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                        child: Column(
                          children: [
                            TextPairWidget(
                              model: profileController.getTextPair('NIS'),
                              boxStyle: BoxStyle.border,
                            ),
                            SizedBox(height: AppSizes.spaceS),
                            TextPairWidget(
                              model: profileController.getTextPair('Kelompok'),
                              boxStyle: BoxStyle.border,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSizes.spaceS),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                        child: Column(
                          children: [
                            TextPairWidget(
                              model: profileController.getTextPair('Nama Lengkap'),
                            ),
                            const SizedBox(height: AppSizes.spaceS),
                            TextPairWidget(
                              model: profileController.getTextPair('Tempat, Tanggal Lahir'),
                            ),
                            const SizedBox(height: AppSizes.spaceS),
                            TextPairWidget(
                              model: profileController.getTextPair('Alamat'),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSizes.spaceS),

                      // Logout Button
                      SizedBox(
                        width: AppSizes.profileCardWidth,
                        child: ReusableButton(
                          buttonText: "Logout",
                          icon: Icons.logout,
                          onPressed: () {
                            loginController.onLogoutPressed(context);
                          },
                          backgroundColor: AppColors.error,
                          textColor: AppColors.textLight,
                        ),
                      ),
                      const SizedBox(height: AppSizes.spaceS),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
