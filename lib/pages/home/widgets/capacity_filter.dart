import 'package:flutter/material.dart';
import 'package:innovareti_test/models/mocked_room_model.dart';

class CapacityFilter extends StatefulWidget {
  const CapacityFilter({
    Key? key,
    required this.size,
    required this.mockedRoomModel,
  }) : super(key: key);

  final Size size;
  final MockedRoomModel mockedRoomModel;

  @override
  State<CapacityFilter> createState() => _CapacityFilterState();
}

class _CapacityFilterState extends State<CapacityFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: widget.size.height * 0.1,
        width: double.infinity,
        child: GridView.builder(
          itemCount: widget.mockedRoomModel.capacityFilters.length,
          itemBuilder: (context, index) {
            var capacity = widget.mockedRoomModel.capacityFilters[index];

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
                        value: capacity['isChecked'],
                        onChanged: (newValue) {
                          setState(() {
                            capacity['isChecked'] = newValue!;
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
    );
  }
}
