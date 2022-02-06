import 'package:flutter/material.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 12,
          automaticallyImplyLeading: true,
          title: const Text("Conference Room"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(
              'Selecione o tipo de reserva:',
              style: AppTextStyles.reservationTitle,
            ),
            SizedBox(height: size.height * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Text('Estação de trabalho'),
                          Text(
                            'R',
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Text('Estação de trabalho'),
                          Text(
                            'R',
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary!),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text('Reservar')),
            )
          ],
        ));
  }
}
