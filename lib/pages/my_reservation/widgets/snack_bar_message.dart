import 'package:flutter/material.dart';

import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

class SnackBarMessage extends StatelessWidget {
  final String text;
  const SnackBarMessage({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showSnackBar(context);
  }

  showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(
        seconds: 1,
      ),
      backgroundColor: AppColors.primary,
      content: const Text(
        'Check-in realizado.',
        style: AppTextStyles.roomCapacity,
      ),
    ));
  }
}
