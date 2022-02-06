import 'package:flutter/material.dart';
import 'package:innovareti_test/pages/home/widgets/purple_divider.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

class RoomFeature extends StatelessWidget {
  final String feature;
  const RoomFeature({
    Key? key,
    required this.feature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(feature, style: AppTextStyles.roomFeatures),
        const PurpleDivider(),
      ],
    );
  }
}
