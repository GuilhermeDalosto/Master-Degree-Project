import 'package:flutter/material.dart';
import '../Model/User.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  late var users = User.generateMock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'res/rankingHeadline.png',
              fit: BoxFit
                  .fitWidth, // Stretch to full width, maintain aspect ratio
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                var guest = users[index];
                return Container(
                  color: index % 2 != 0
                      ? Colors.white
                      : Color.fromRGBO(169, 196, 164, 1),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Imagem do usuário
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('res/${guest.imageName}'),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Espaço entre imagem e texto
                      // Nome e pontos
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            guest.name,
                            style: const TextStyle(
                              fontFamily: 'Sailors',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              height: 1, // Coloca os textos colados
                            ),
                          ),
                          Text(
                            guest.points.toString(),
                            style: TextStyle(
                              fontFamily: 'Sailors',
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontSize,
                              height: 1, // Coloca os textos colados
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
