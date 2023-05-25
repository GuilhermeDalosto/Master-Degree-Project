import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_enf/pages/LoginPage.dart';
import 'package:tcc_enf/pages/TinderComponent/FeedbackPositionProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => FeedbackPositionProvider(),
        child: MaterialApp(
          title: 'Adivinhe Enfermagem',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginPage(),
        ),
      );
}