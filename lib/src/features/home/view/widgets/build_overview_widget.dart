import 'package:flutter/material.dart';
import 'package:movies_app/src/features/home/view/widgets/cast_details_widget.dart';

Widget buildOverviewWidget({
  required BuildContext context,
  required String title,
  required String overview,
}) {
  return SafeArea(
    minimum: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.35,
    ),
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 5,
                width: 100,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Overview',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              overview,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Cast',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const CastDetails()
          ],
        ),
      ),
    ),
  );
}
