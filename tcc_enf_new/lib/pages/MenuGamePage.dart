import 'package:flutter/material.dart';
import 'TinderPage.dart';

class MenuGamePage extends StatefulWidget {
  const MenuGamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<MenuGamePage> {
  @override
  Widget build(BuildContext context) {
    final double buttonWidth =
        MediaQuery.of(context).size.width * 0.8; // 60% of screen width

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("res/gameBackground.png"),
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            InkWell(
              child: Image.asset(
                "res/playButton.png",
                width: buttonWidth,
                fit: BoxFit.contain, // Adjust height proportionally
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TinderPage()),
                );
              },
            ),
            const SizedBox(height: 30), // Space between buttons
            InkWell(
              child: Image.asset(
                "res/rulesButton.png",
                width: buttonWidth,
                fit: BoxFit.contain, // Adjust height proportionally
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    content: Builder(
                      builder: (context) {
                        var height = MediaQuery.of(context).size.height;
                        var width = MediaQuery.of(context).size.width;

                        return Container(
                          height: height - 250,
                          width: width - 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("res/ruleBackground.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
