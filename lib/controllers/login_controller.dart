import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talentaku_app_guru/apiModels/user_model.dart';
import 'package:talentaku_app_guru/apiservice/api_Service.dart';
import 'package:talentaku_app_guru/controllers/class_detail_controller.dart';
import 'package:talentaku_app_guru/controllers/grade_controller.dart';
import 'package:talentaku_app_guru/controllers/home_controller.dart';
import 'package:talentaku_app_guru/controllers/profile_controller.dart';
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
  var loginModel = LoginModel().obs;
  var isImagePicked = false.obs;
  var profileImage = ''.obs;
  var user = Rxn<UserModel>();
  var isLoading = false.obs;

@override
  void onInit() {
    super.onInit();
    usernameController.addListener(updateCredentials);
    passwordController.addListener(updateCredentials);
  }

  Future<void> login(
      BuildContext context, String username, String password) async {
    isLoading.value = true;
    isLoading.refresh();

    try {
      final response = await ApiService.login(username, password);
      if (response.containsKey('data')) {
        // Create user model from data
        final userData = Map<String, dynamic>.from(response['data']);
        // Add token and fcm_token to userData
        userData['token'] = response['token'];
        userData['fcm_token'] = response['fcm_token'];

        // Create temporary user model to check roles
        final tempUser = UserModel.fromJson(userData);
        
        // Check if user has valid role (guru KB or guru SD)
        bool hasValidRole = tempUser.roles.any((role) => 
          role.toLowerCase() == 'guru kb' || role.toLowerCase() == 'guru sd'
        );

        if (!hasValidRole) {
          Get.snackbar(
            'Error', 
            'Access denied. Only Guru KB and Guru SD roles are allowed.',
            backgroundColor: Colors.red,
            colorText: Colors.white
          );
          return;
        }

        user.value = tempUser;

        if (user.value?.photo != null) {
          profileImage.value = user.value!.photo!;
        }

        // Delete any existing controllers to ensure fresh state
        Get.delete<HomeController>(force: true);
        Get.delete<ProfileController>(force: true);

        // Create new instances of controllers with fresh state
        final homeController = Get.put(HomeController());
        final profileController = Get.put(ProfileController());

        // Initialize the new controllers with the current user data
        homeController.user.value = user.value;
        profileController.user.value = user.value;

        // Fetch fresh data for the new user
        homeController.fetchInformation();
        homeController.fetchUserProfile();
        profileController.fetchUserData();

        Get.snackbar('Success', 'Login Successful');
        Get.offAll(() => LoginPickImage());
      } else {
        Get.snackbar('Error', 'Invalid username or password');
      }
    } catch (e) {
      Get.snackbar('Error', 'Invalid username or password');
    } finally {
      isLoading.value = false;
      isLoading.refresh();
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      secondaryText: homeController.roles,
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

  void updateCredentials() {
    loginModel.value.updateLoginState(
      usernameController.text,
      passwordController.text,
    );
  }

  void onLoginPressed(BuildContext context) {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    if (username.isNotEmpty && password.isNotEmpty) {
      login(context, username, password);
    } else {
      Get.snackbar('Error', 'Please fill all fields');
    }
  }

  void resetForm() {
    usernameController.clear();
    passwordController.clear();
    isImagePicked.value = false;
    profileImage.value = '';
  }

  void onLogoutPressed(BuildContext context) async {
    // Clear all user data from LoginController
    user.value = null;
    profileImage.value = '';

    // Clear all controllers that might have user data
    if (Get.isRegistered<HomeController>()) {
      final homeController = Get.find<HomeController>();
      homeController.user.value = null;
      homeController.informationList.clear();
    }

    if (Get.isRegistered<ProfileController>()) {
      final profileController = Get.find<ProfileController>();
      profileController.user.value = null;
    }

    // Clear grade-related controllers
if (Get.isRegistered<GradeController>()) {
  final gradeController = Get.find<GradeController>();
  gradeController.classEvents.clear();
  Get.delete<GradeController>(force: true);
}
if (Get.isRegistered<ClassDetailController>()) {
  final classDetailController = Get.find<ClassDetailController>();
  classDetailController.gradeDetail.value = null;
  Get.delete<ClassDetailController>(force: true);
}

    

    // Delete all GetX controllers except LoginController
    Get.delete<HomeController>(force: true);
    Get.delete<ProfileController>(force: true);
    Get.delete<GradeController>(force: true);
    Get.delete<ClassDetailController>(force: true);

    await ApiService.removeToken(); // Remove the stored token
    resetForm();
    Get.snackbar(
      'Anda Berhasil Logout',
      'Anda telah keluar dari akun Anda.',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(AppSizes.paddingXL),
    );
    Get.offAll(() => LoginScreen());
  }

  @override
  void onClose() {
    // Hapus listener sebelum dispose
    usernameController.removeListener(updateCredentials);
    passwordController.removeListener(updateCredentials);

    super.onClose();
  }
}
