// import 'package:flutter/material.dart';
// import 'package:talentaku_app_guru/constants/app_colors.dart';
// import 'package:talentaku_app_guru/constants/app_sizes.dart';
// import 'package:talentaku_app_guru/constants/app_text_styles.dart';

// import 'package:talentaku_app_guru/widgets/student_list.dart';

// class StudentPickerSheet extends StatelessWidget {
//   final List<Map<String, String>> students;

//   const StudentPickerSheet({
//     Key? key,
//     required this.students,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(AppSizes.paddingXL),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(AppSizes.radiusXL),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Pilih Siswa',
//             style: AppTextStyles.heading3,
//           ),
//           SizedBox(height: AppSizes.spaceL),
//           StudentList(students: students),
//         ],
//       ),
//     );
//   }
// } 