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
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              "res/gameBackground.png",
              fit: BoxFit.cover,
            ),
          ),

          // Botões sobrepostos
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Primeiro botão (Play)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TinderPage()),
                    );
                  },
                  child: Image.asset(
                      "res/playButton.png"), // Mantendo tamanho original
                ),

                // Segundo botão (Rules) 20px abaixo
                Positioned(
                  // top: 20, // 20 pixels abaixo do primeiro
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
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
                    child: Image.asset(
                        "res/rulesButton.png"), // Mantendo tamanho original
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
