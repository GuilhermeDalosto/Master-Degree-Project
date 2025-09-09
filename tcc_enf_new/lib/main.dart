import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/LoginPage.dart';
import '../pages/TinderComponent/FeedbackPositionProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => FeedbackPositionProvider(),
        child: MaterialApp(
          title: 'Acerto',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginPage(),
        ),
      );
}
