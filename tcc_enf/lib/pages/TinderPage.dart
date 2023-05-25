import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_enf/Model/Card.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import '../pages/TinderComponent/FeedbackPositionProvider.dart';
import '../pages/TinderComponent/UserCard.dart';
import '../pages/TinderComponent/CategoryButtons.dart';

typedef void clickCallback(int position);

class TinderPage extends StatefulWidget {
  @override
  _TinderPageState createState() => _TinderPageState();
}

class _TinderPageState extends State<TinderPage> {
  List<CardGame> cards = getCards(0);
  static AudioCache player = AudioCache();

  var corretas = 0;
  var incorretas = 0;

  static List<CardGame> getCards(int position) {
    List<CardGame> list = [];
    const names = [
      "Abdominal",
      "Cabeça",
      "Sistema Cardíaco",
      "Locomotor e Pele",
      "Sistema Respiratório",
      "Sistema Neurológico"
    ];
    const images = [
      "abdomen",
      "cabeca",
      "cardiaco",
      "pele", 
      "respiratorio",
      "neuro"
    ];

    for (int i = 1; i <= 10; i++) {
      list.add(CardGame(name: names[position], image: "${images[position]}$i"));
    }

    list.shuffle();

    return list;
  }

  @override
  Widget build(context) => Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              cards.isEmpty
                  ? const Text('No more cards')
                  : Stack(children: cards.map(buildUser).toList()),
              Expanded(child: Container()),
              CategoryButtonsWidget(
                  callback: (value) =>
                      setState(() => this.cards = getCards(value))),
              SizedBox(height: 50),
              // BottomButtonsWidget()
            ],
          ),
        ),
      );

  PreferredSizeWidget buildAppBar() => AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Transform.scale(
          scale: 1.3,
          child: IconButton(
              icon: new Icon(Icons.house, color: Colors.purple),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }
              })),
      actions: [
        Transform.scale(
          scale: 1.6,
          child: Row(children: [            
            Icon(Icons.done_rounded, color: Colors.green),
            Text("$corretas", style: TextStyle(color: Colors.green)),
            SizedBox(width: 15),
          ]))
      ],
      leading: 
      Transform.scale(
            scale: 1.6,
            child: Row(children: [
              SizedBox(width: 15),
              Icon(Icons.close, color: Colors.red),
              Text("$incorretas", style: TextStyle(color: Colors.red)),              
            ]))
            );

  Widget buildUser(CardGame user) {
    final userIndex = cards.indexOf(user);
    final isUserInFocus = userIndex == cards.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      onPointerCancel: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      onPointerUp: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      child: Draggable(
        child: UserCardWidget(card: user, isUserInFocus: isUserInFocus),
        feedback: Material(
          type: MaterialType.transparency,
          child: UserCardWidget(card: user, isUserInFocus: isUserInFocus),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, user),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, CardGame user) {
    final minimumDrag = 100;
    if (details.offset.dx > minimumDrag) {
      user.isSwipedOff = true;
    } else if (details.offset.dx < -minimumDrag) {
      user.isLiked = true;
    }

    var number = user.image.replaceAll(RegExp(r'[^0-9]'), '');
    var cardAnswer = int.parse(number) % 2 == 0;

    if ((cardAnswer == true && user.isLiked) ||
        (cardAnswer == false && user.isSwipedOff)) {
      corretas += 1;
      player.play('correct.mp3');
    } else {
      incorretas += 1;
      player.play('wrong.mp3');
    }
    print(user.image);
    print(number);

    setState(() => cards.remove(user));
  }
}
