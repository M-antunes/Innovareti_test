import 'package:flutter/material.dart';
import 'package:innovareti_test/pages/home/home_page.dart';
import 'package:innovareti_test/pages/my_reservation/my_reservation.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  var primaryColor = Colors.teal;

  final List<Widget> _children = [
    const HomePage(),
    const MyReservations(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedIconTheme: IconThemeData(color: AppColors.primary),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        unselectedLabelStyle: const TextStyle(color: Colors.blue),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.bookmark_border_outlined),
            label: "Minhas Reservas",
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
