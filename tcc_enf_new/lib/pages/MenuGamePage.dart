import "package:flutter/material.dart";
import 'TinderPage.dart';

class MenuGamePage extends StatefulWidget {
  const MenuGamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<MenuGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("res/gameBackground.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content layered on top
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 130),
              InkWell(
                child: Image.asset(
                  "res/playButton.png",
                  width: 300,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TinderPage()),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkWell(
                child: Image.asset(
                  "res/rulesButton.png",
                  width: 300,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      content: Builder(
                        builder: (context) {
                          var height = MediaQuery.of(context).size.height;
                          var width = MediaQuery.of(context).size.width;

                          return Container(
                            height: height,
                            width: width,
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
        ],
      ),
    );
  }
}
