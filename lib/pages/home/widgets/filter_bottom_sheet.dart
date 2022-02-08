import 'package:flutter/material.dart';

import 'package:innovareti_test/controller/reservation_controller.dart';
import 'package:innovareti_test/pages/home/widgets/qualification_filter.dart';
import 'package:innovareti_test/shared/widgets/app_button.dart';
import 'package:innovareti_test/shared/widgets/horizontal_divider.dart';

import 'capacity_filter.dart';
import 'leading_info_of_filter_bottom_sheet.dart';

class FilterBottomSheet extends StatelessWidget {
  final Size size;
  final ReservationController controller;
  const FilterBottomSheet({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadingInfoOfFilterBottomSheet(size: size),
          const HorizontalDivider(),
          QualificationFilter(size: size),
          const HorizontalDivider(),
          CapacityFilter(size: size),
          SizedBox(
            height: size.height * 0.01,
          ),
          InkWell(
            onTap: () {
              controller.filter();
              Navigator.pop(context);
            },
            child: AppButton(
              text: 'Filtrar',
              boolean1: true,
              boolean2: false,
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}
