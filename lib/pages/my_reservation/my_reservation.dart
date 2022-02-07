import 'package:flutter/material.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';
import 'package:innovareti_test/shared/widgets/horizontal_divider.dart';

class MyReservations extends StatelessWidget {
  const MyReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 12,
        title: const Text("Conference Room"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 30,
                ),
                SizedBox(width: size.width * 0.05),
                Text(
                  'Perfil',
                  style: AppTextStyles.roomReserveButton,
                ),
              ],
            ),
          ),
          HorizontalDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Minhas Reservas',
              style: AppTextStyles.roomReserveButton,
            ),
          ),
          HorizontalDivider(),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: ListTile(
                      leading: SizedBox(
                          width: size.width * 0.25,
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child:
                                  Image.asset('assets/images/room_one.jpg'))),
                      title: Text('Nome da Sala'),
                      subtitle: Text('Você reservou esta sala.'),
                      trailing: SizedBox(
                        width: size.width * 0.2,
                        child: Row(
                          children: [
                            Text(
                              'CheckIn\nAqui',
                              textAlign: TextAlign.center,
                            ),
                            Icon(Icons.check),
                          ],
                        ),
                      ),
                    ),
                  );
                  // ListTile(
                  //   leading: ClipRRect(
                  //     borderRadius: BorderRadius.circular(50),
                  //     child: Image.asset('assets/images/room_one.jpg'),
                  //   ),
                  //   title: Text('Nome da Sala'),
                  //   subtitle: Text('Você reservou esta página.'),
                  //   trailing: Row(
                  //     children: [
                  //       Icon(Icons.check),
                  //       Text('CheckIn'),
                  //     ],
                  //   ),
                  // ),
                }),
          ),
        ],
      ),
    );
  }
}
