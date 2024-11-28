import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:search_countries_assessment/app/utils/text_style.dart';

import '../utils/app_colors.dart';

successSnackBar({required String title, required String message}) {
  return Get.snackbar(
    '',
    // Empty string because we are using custom widgets for title and message
    '',
    backgroundColor: AppColors.whiteColor,
    duration: const Duration(seconds: 2),
    snackStyle: SnackStyle.GROUNDED,
    messageText: Text(
      message,
      style: bodyMediumLightBlack,
    ),
    titleText: Text(title, style: bodyLarge),
  );
}

failedSnackBar({required String title, required String message}) {
  return Get.snackbar(title, message,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      duration: const Duration(seconds: 3));
}
