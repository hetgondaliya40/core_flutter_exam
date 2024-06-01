import 'dart:developer';

import 'package:flutter/material.dart';

import '../gloabls/routes.dart';
import '../product/products.dart';

Widget myProduct({required BuildContext context, required String cate}) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  TextScaler textScale = MediaQuery.textScalerOf(context);
  log("CATEGORY: $cate");
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ...products.map(
          (e) => (cate == e['category'])
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.detail_page);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.22,
                          width: w * 0.43,
                          decoration: BoxDecoration(
                            color: const Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: NetworkImage(
                                e['thumbnail'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          e['title'].toString(),
                          style: TextStyle(
                            fontSize: textScale.scale(16),
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          e['category'],
                          style: TextStyle(
                            fontSize: textScale.scale(13),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff666666),
                          ),
                        ),
                        Text(
                          e['price'].toString(),
                          style: TextStyle(
                            fontSize: textScale.scale(16),
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        )
      ],
    ),
  );
}
