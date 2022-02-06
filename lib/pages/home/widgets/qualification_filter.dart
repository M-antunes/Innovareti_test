import 'package:flutter/material.dart';
import 'package:innovareti_test/models/mocked_room_model.dart';

class QualificationFilter extends StatefulWidget {
  const QualificationFilter({
    Key? key,
    required this.size,
    required this.mockedRoomModel,
  }) : super(key: key);

  final Size size;
  final MockedRoomModel mockedRoomModel;

  @override
  State<QualificationFilter> createState() => _QualificationFilterState();
}

class _QualificationFilterState extends State<QualificationFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: widget.size.height * 0.15,
        width: double.infinity,
        child: GridView.builder(
          itemCount: widget.mockedRoomModel.listOfFeaturesToCheck.length,
          itemBuilder: (context, index) {
            var feature = widget.mockedRoomModel.featureFilters[index];

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
                        value: feature['isChecked'],
                        onChanged: (newValue) {
                          setState(() {
                            feature['isChecked'] = newValue!;
                          });
                        }),
                    Text(
                      feature['name'],
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
