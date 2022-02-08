import 'package:flutter/material.dart';

import 'package:innovareti_test/controller/reservation_controller.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';
import 'package:innovareti_test/shared/widgets/horizontal_divider.dart';
import 'package:provider/provider.dart';

class QualificationFilter extends StatefulWidget {
  final Size size;

  const QualificationFilter({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<QualificationFilter> createState() => _QualificationFilterState();
}

class _QualificationFilterState extends State<QualificationFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Text(
            'Qualificações',
            style: AppTextStyles.filterOption,
          ),
        ),
        const HorizontalDivider(),
        SizedBox(
          height: widget.size.height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: widget.size.height * 0.15,
            width: double.infinity,
            child: GridView.builder(
              itemCount:
                  context.read<ReservationController>().featureFilters.length,
              itemBuilder: (context, index) {
                var feature =
                    context.read<ReservationController>().featureFilters[index];

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                            activeColor: AppColors.primary,
                            value: feature['isChecked'],
                            onChanged: (newValue) {
                              setState(() {
                                feature['isChecked'] = newValue!;
                              });
                            }),
                        SizedBox(
                          width: widget.size.width * 0.28,
                          child: Text(
                            feature['name'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 14 / 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
