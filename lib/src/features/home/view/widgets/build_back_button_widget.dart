import 'package:flutter/material.dart';

Widget buildBackButtonWidget(BuildContext context) {
  return SafeArea(
    child: Column(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.deepOrangeAccent,
            size: 30,
          ),
        ),
      ],
    ),
  );
}
