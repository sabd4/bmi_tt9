import 'package:flutter/material.dart';

import '../constants.dart';

class Result extends StatelessWidget {
  String type;
  double result;
  String range;
  String message;
  Color tColor;
  Result({
    Key? key,
    required this.type,
    required this.result,
    required this.range,
    required this.message,
    required this.tColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Your Result",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: buttonBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          type,
                          style: TextStyle(color: tColor, fontSize: 24),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$result",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 56,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Normal BMI range:",
                            style: TextStyle(color: greyc, fontSize: 24),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$range kg/m2",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        message,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: elevatedColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32)),
                        onPressed: () {},
                        child: const Text("Share The Result"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: sliderColor,
                      padding: const EdgeInsets.all(24)),
                  child: const Text(
                    "RE-CALCULATE YOUR BMI ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "bmi");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
