import 'package:bmi_tt9/Widgets/my_card.dart';
import 'package:bmi_tt9/pages/result.dart';
import 'package:flutter/material.dart';

import '../bmi_brain.dart';
import '../constants.dart';
import '../widgets/gender_button.dart';
import '../widgets/my_card.dart';

class BMIcalc extends StatefulWidget {
  const BMIcalc({super.key});

  @override
  State<BMIcalc> createState() => _BMIcalcState();
}

class _BMIcalcState extends State<BMIcalc> {
  BMIbrain brain = BMIbrain();
  bool isclicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isclicked = !isclicked;
                        brain.setGender('male');
                      });
                    },
                    child: GenderButton(
                      icon: Icons.male,
                      text: 'Male',
                      isClicked: isclicked,
                      bgcolor: isclicked
                          ? buttonBackground.withOpacity(0.6)
                          : buttonBackground,
                      textcolor: isclicked ? greyc : Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isclicked = !isclicked;
                        brain.setGender("female");
                      });
                    },
                    child: GenderButton(
                      icon: Icons.female,
                      text: 'Female',
                      isClicked: !isclicked,
                      bgcolor: !isclicked
                          ? buttonBackground.withOpacity(0.6)
                          : buttonBackground,
                      textcolor: !isclicked ? greyc : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: buttonBackground,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hight",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${brain.getHieght().toInt()} cm",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 2,
                        trackShape: RectangularSliderTrackShape(),
                      ),
                      child: Slider(
                        min: 100,
                        max: 200,
                        value: brain.getHieght(),
                        onChanged: (v) {
                          setState(() {
                            brain.setHieght(v);
                          });
                        },
                        activeColor: Colors.white.withOpacity(0.8),
                        inactiveColor: Colors.white.withOpacity(0.4),
                        thumbColor: sliderColor,
                      ),
                    )
                  ],
                ),
              ),
            )),
            Row(
              children: [
                Expanded(
                  child: MyContainer(
                    number: brain.getWieght(),
                    text: 'Wieght',
                    add: () {
                      setState(() {
                        brain.setWieght(brain.getWieght() + 1);
                      });
                    },
                    sub: () {
                      setState(() {
                        brain.setWieght(brain.getWieght() - 1);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    number: brain.getAge(),
                    text: 'Age',
                    add: () {
                      setState(() {
                        brain.setAge(brain.getAge() + 1);
                      });
                    },
                    sub: () {
                      setState(() {
                        brain.setAge(brain.getAge() - 1);
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: sliderColor,
                    padding: const EdgeInsets.all(16)),
                child: const Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                onPressed: () {
                  brain.calcBmi();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Result(
                              type: brain.type,
                              result: brain.result,
                              range: brain.range,
                              message: brain.m,
                              tColor: brain.tcolor)));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
