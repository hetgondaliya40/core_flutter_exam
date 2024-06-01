import 'package:exam11/utills/componets/products.dart';
import 'package:exam11/utills/product/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utills/componets/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    category.insert(0, "All");
  }

  @override
  Widget build(BuildContext context) {
    TextScaler textScale = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Hello, Welcome 👋",
                      ),
                      Text(
                        "Albert Stevano",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    child: Icon(
                      CupertinoIcons.profile_circled,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 65,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    child: Icon(Icons.menu),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...category.map(
                      (e) => myCategory(
                        category: e,
                        textScale: textScale,
                        setState: () {
                          setState(() {});
                        },

                        // setState: mySetState,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (cate == 'All') ...[
                      Column(
                        children: [
                          ...category.map(
                            (e) => myProduct(context: context, cate: e),
                          ),
                        ],
                      ),
                    ] else ...[
                      myProduct(context: context, cate: cate),
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
