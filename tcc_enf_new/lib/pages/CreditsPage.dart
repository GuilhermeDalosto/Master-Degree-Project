import "package:flutter/material.dart";
import '../Model/User.dart';

class CreditsPage extends StatefulWidget {
  CreditsPage({Key? key}) : super(key: key);

  @override
  _CreditsPageState createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('res/credits.png'), fit: BoxFit.fill),
      ),
    );
  }
}
