import 'package:flutter/material.dart';

class PurpleDivider extends StatelessWidget {
  const PurpleDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      height: 20,
      width: 1,
      color: Colors.purple[900],
    );
  }
}
