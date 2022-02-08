import 'package:flutter/material.dart';
import 'package:innovareti_test/controller/reservation_controller.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';
import 'package:innovareti_test/shared/widgets/horizontal_divider.dart';
import 'package:provider/src/provider.dart';

class CapacityFilter extends StatefulWidget {
  const CapacityFilter({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<CapacityFilter> createState() => _CapacityFilterState();
}

class _CapacityFilterState extends State<CapacityFilter> {
  late final ReservationController _controller;

  @override
  void initState() {
    _controller = context.read<ReservationController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Text(
            'Capacidade da Sala',
            style: AppTextStyles.filterOption,
          ),
        ),
        const HorizontalDivider(),
        SizedBox(
          height: size.height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: widget.size.height * 0.1,
            width: double.infinity,
            child: GridView.builder(
              itemCount: _controller.capacityFilters.length,
              itemBuilder: (context, index) {
                var capacity = _controller.capacityFilters[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio<int>(
                            toggleable: true,
                            value: index,
                            groupValue: _controller.capacitySelected,
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue == null) {
                                  _controller.capacitySelected = -1;
                                } else {
                                  _controller.capacitySelected = newValue;
                                }
                              });
                            }),
                        Text(
                          capacity['name'],
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
