import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> pro =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * 0.55,
              width: w,
              color: const Color(0xffeee5db),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Text(
                        "Product Details",
                        style: TextStyle(
                          fontSize: textScaler.scale(22),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: h * 0.30,
                        width: w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(pro['thumbnail']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pro['title'],
                    style: TextStyle(
                      fontSize: textScaler.scale(20),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Divider(),
                  Text(
                    "Product Details  :-  ",
                    style: TextStyle(
                      fontSize: textScaler.scale(20),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.005,
                  ),
                  Text(
                    pro['description'].toString(),
                    style: TextStyle(
                      fontSize: textScaler.scale(10),
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Price :     ${pro['price'].toString()}",
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Rating :   ⭐ ${pro['rating'].toString()}",
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "category :    ${pro['category'].toString()}",
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: h * 0.09,
                width: w * 0.9,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "🛒 Add Item  ",
                      style: TextStyle(
                          fontSize: textScaler.scale(23), color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
