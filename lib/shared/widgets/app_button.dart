import 'package:flutter/material.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final Size size;
  final String text;
  final bool boolean1;
  final bool boolean2;

  const AppButton({
    Key? key,
    required this.size,
    required this.text,
    required this.boolean1,
    required this.boolean2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                boolean1 || boolean2 ? AppColors.primary! : Colors.grey[600]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: boolean1 || boolean2
                ? AppTextStyles.roomReserveButton
                : TextStyle(color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
