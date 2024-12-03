import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talentaku_app_guru/controllers/home_controller.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../models/login_models.dart';
import '../models/profile_image_picker.dart';
import '../models/text_pair.dart';
import '../models/text_field.dart'; // Import CustomTextFieldModel
import '../views/login/login_pick_image.dart';
import '../views/login/login.dart';

class LoginController extends GetxController {
  var uploadedImages = <String>[].obs;

  // Login model for state management
  var loginModel = LoginModel().obs;

  // Controllers for username and password
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Observable for image picked state
  var isImagePicked = false.obs;
  var profileImage = ''.obs;

  // Function to create a CustomTextPair model
  CustomTextPairModel getPair() {
    return CustomTextPairModel(
      primaryText: "Selamat Datang",
      secondaryText: "Semangat buat hari ini ya...",
      primaryStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
      secondaryStyle: TextStyle(fontSize: 16, color: Colors.black),
      alignment: CrossAxisAlignment.start,
    );
  }

  // Function to create a CustomTextPair model
  CustomTextPairModel getCustomTextPair() {
    final homeController = Get.find<HomeController>();
    return CustomTextPairModel(
      primaryText: homeController.userName,
      secondaryText: "Siswa KB",
      primaryStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.textDark),
      secondaryStyle: TextStyle(fontSize: 16, color: AppColors.primary),
      alignment: CrossAxisAlignment.start,
    );
  }

  CustomTextFieldModel getUsernameModel() {
    return CustomTextFieldModel(
      controller: usernameController,
      labelText: 'Username',
      onChanged: (value) => updateCredentials(),
    );
  }

  CustomTextFieldModel getPasswordModel() {
    return CustomTextFieldModel(
      controller: passwordController,
      labelText: 'Password',
      isPassword: true,
      onChanged: (value) => updateCredentials(),
    );
  }

  ProfileImagePickerModel getProfileImagePickerModel(BuildContext context) {
    return ProfileImagePickerModel(
      image: isImagePicked.value
          ? FileImage(File(profileImage.value))
          : AssetImage('images/default_image.png') as ImageProvider,
      avatarRadius: 80,
      cameraRadius: 25,
      cameraBackgroundColor: AppColors.primary,
      cameraIcon: Icon(Icons.camera_alt, color: AppColors.textLight, size: 24),
      onCameraTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(AppSizes.spaceL),
              height: 280,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(height: AppSizes.spaceL),
                  Text(
                    "Pilih Sumber Foto",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark),
                  ),
                  SizedBox(height: AppSizes.spaceXL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOption(
                        icon: Icons.camera_alt,
                        label: "Kamera",
                        onTap: () {
                          Navigator.pop(context);
                          pickImageFromCamera(context);
                        },
                      ),
                      buildOption(
                        icon: Icons.photo_library,
                        label: "Galeri",
                        onTap: () {
                          Navigator.pop(context);
                          pickImageFromGallery(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      profileImage.value = pickedFile.path;
      isImagePicked.value = true;
    }
  }

  Future<void> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage.value = pickedFile.path;
      isImagePicked.value = true;
    }
  }

  Future<void> pickMultipleImages(BuildContext context) async {
    final picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      for (var file in pickedFiles) {
        uploadedImages.add(file.path);
      }
    }
  }

  void removeImage(int index) {
    uploadedImages.removeAt(index);
  }

  static Widget buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    usernameController.addListener(updateCredentials);
    passwordController.addListener(updateCredentials);
  }

  void updateCredentials() {
    loginModel.value.updateLoginState(
      usernameController.text,
      passwordController.text,
    );
  }

  // Update the isValid function to check if username and password are at least 8 characters
  bool isValid() {
    return usernameController.text.length >= 8 &&
        passwordController.text.length >= 8 &&
        loginModel.value.isValid;
  }

  void onLoginPressed(BuildContext context) {
    if (isValid()) {
      Get.to(() => LoginPickImage());
    } else {
      Get.snackbar(
        'Error',
        'Username dan password harus diisi dan minimal 8 karakter!',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(AppSizes.paddingXL),
      );
    }
  }

  void resetForm() {
    usernameController.clear();
    passwordController.clear();
    isImagePicked.value = false;
    profileImage.value = '';
  }

  void onLogoutPressed(BuildContext context) {
    Get.snackbar(
      'Anda Berhasil Logout',
      'Anda telah keluar dari akun Anda.',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(AppSizes.paddingXL),
    );
    resetForm();
    Get.offAll(() => LoginScreen());
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
