import 'package:flutter/material.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: size.height * 0.08,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: SizedBox(
              width: size.width * 0.8,
              child: const FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  'Encontre aqui a sala de reuniões perfeita para você',
                  style: AppTextStyles.roomFeatures,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
