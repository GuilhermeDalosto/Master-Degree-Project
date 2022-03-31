import "package:flutter/material.dart";
import 'TinderPage.dart';

class MenuGamePage extends StatefulWidget {
  MenuGamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<MenuGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("res/gameBackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: [
              SizedBox(height: 130),
              InkWell(
                child: new Image.asset("res/playButton.jpg", width: 300),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TinderPage()),
                  )
                },
              ),
              SizedBox(height: 30),
              InkWell(
                child: new Image.asset("res/rulesButton.jpg", width: 300),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            content: Builder(
                              builder: (context) {
                                var height = MediaQuery.of(context).size.height;
                                var width = MediaQuery.of(context).size.width;

                                return Container(
                                  height: height - 250,
                                  width: width - 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage("res/ruleBackground.png"),
                                    fit: BoxFit.fill,
                                  )),
                                );
                              },
                            ),
                          ));
                },
              )
            ])));
  }
}
