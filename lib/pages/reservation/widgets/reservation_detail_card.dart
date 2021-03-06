import 'package:flutter/material.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

class ReservationDetailCard extends StatelessWidget {
  final Size size;
  final bool isSelected;
  final String text;
  final String imageString;
  final String textDetail;

  const ReservationDetailCard({
    Key? key,
    required this.size,
    required this.isSelected,
    required this.text,
    required this.imageString,
    required this.textDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: size.width * 0.35,
          height: isSelected ? size.height * 0.35 : size.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: AppTextStyles.roomReserveBoxText,
              ),
              SizedBox(
                width: size.width * 0.25,
                height: size.height * 0.1,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.asset(imageString),
                ),
              ),
              Visibility(
                  visible: isSelected,
                  child: Text(
                    textDetail,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.roomReserveBoxDetails,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
