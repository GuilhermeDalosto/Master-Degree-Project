import 'package:flutter/material.dart';
import '../TinderPage.dart';

class CategoryButtonsWidget extends StatelessWidget {
  final clickCallback callback;

  CategoryButtonsWidget({required this.callback});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              this.callback(0);
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Transform.scale(
                  scale: 2.3, child: Image.asset("res/babyCard.png")),
            ),
          ),
          GestureDetector(
            onTap: () {
              this.callback(1);
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Transform.scale(
                  scale: 2.3, child: Image.asset("res/pregnantCard.png")),
            ),
          ),
          GestureDetector(
            onTap: () {
              this.callback(2);
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Transform.scale(
                  scale: 2.3, child: Image.asset("res/elderCard.png")),
            ),
          ),
        ],
      );
}
