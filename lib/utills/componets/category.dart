import 'package:flutter/material.dart';

String cate = "All";

Widget myCategory({
  required String category,
  required TextScaler textScale,
  required Function() setState,
}) {
  return GestureDetector(
    onTap: () {
      cate = category;
      setState();
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: (cate == category) ? Colors.black : Colors.transparent,
        border: Border.all(
          color: (cate == category) ? Colors.transparent : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category.replaceFirst(
          category[0],
          category[0].toUpperCase(),
        ),
        style: TextStyle(
          fontSize: textScale.scale(18),
          letterSpacing: 0.6,
          color: (cate == category) ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}
