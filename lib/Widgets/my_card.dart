import 'package:flutter/material.dart';

import '../constants.dart';
import 'My_Fab.dart';

class MyContainer extends StatefulWidget {
  String text;
  int number;
  Function() add;
  Function() sub;
  MyContainer({
    Key? key,
    required this.text,
    required this.number,
    required this.add,
    required this.sub,
  }) : super(key: key);

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: buttonBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          widget.text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "${widget.number}",
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyFAB(
              icon: Icons.add,
              function: widget.add,
            ),
            MyFAB(
              icon: Icons.remove,
              function: widget.sub,
            ),
          ],
        )
      ]),
    );
  }
}
