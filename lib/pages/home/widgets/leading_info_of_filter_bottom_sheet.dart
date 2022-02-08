import 'package:flutter/material.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

class LeadingInfoOfFilterBottomSheet extends StatelessWidget {
  const LeadingInfoOfFilterBottomSheet({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Center(
            child: Container(
              width: size.width * 0.4,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Filtrar',
              style: AppTextStyles.filterBy,
            ),
          ),
        ),
      ],
    );
  }
}
