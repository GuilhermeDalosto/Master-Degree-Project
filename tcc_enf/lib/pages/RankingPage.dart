import "package:flutter/material.dart";
import 'package:tcc_enf/Model/User.dart';

class RankingPage extends StatefulWidget {
  RankingPage({Key? key}) : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  late var users = User.generateMock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      // new Container(
      //   padding: EdgeInsets.all(5),
      //     child: new Image.asset('res/rankingHeadline.png')
      //     ),

      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            var guest = users[index];
            return Container(
                color: index % 2 != 0
                    ? Color.fromRGBO(255, 255, 255, 1)
                    : Color.fromRGBO(169, 196, 164, 1),
                child: ListTile(
                  contentPadding: EdgeInsets.only(top: 15, left: 10),
                  leading: new Container(
                      width: 60.0,
                      height: 190.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fitHeight,
                              image:
                                  new AssetImage('res/${guest.imageName}')))),
                  title: Text(guest.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(guest.points),
                ));
          })
    ]));
  }
}
