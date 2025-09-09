import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_enf/Model/Card.dart';
import 'package:just_audio/just_audio.dart';
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

  var corretas = 0;
  var incorretas = 0;

  // Player de áudio usando just_audio
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

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

  Future<void> playCorrect() async {
    await _audioPlayer.setAsset('assets/correct.mp3');
    _audioPlayer.play();
  }

  Future<void> playWrong() async {
    await _audioPlayer.setAsset('assets/wrong.mp3');
    _audioPlayer.play();
  }

  @override
  Widget build(context) => Scaffold(
        extendBodyBehindAppBar: true, // permite que o gradiente vá até o topo
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Transform.scale(
            scale: 1.3,
            child: IconButton(
              icon: const Icon(Icons.house, color: Colors.orange),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }
              },
            ),
          ),
          actions: [
            Transform.scale(
              scale: 1.6,
              child: Row(children: [
                const Icon(Icons.done_rounded, color: Colors.green),
                Text("$corretas", style: const TextStyle(color: Colors.green)),
                const SizedBox(width: 15),
              ]),
            )
          ],
          leading: Transform.scale(
            scale: 1.6,
            child: Row(children: [
              const SizedBox(width: 15),
              const Icon(Icons.close, color: Colors.red),
              Text("$incorretas", style: const TextStyle(color: Colors.red)),
            ]),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.teal.shade100,
                Colors.teal.shade300,
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 20), // espaço do AppBar
              // Aqui você pode adicionar as imagens em leque, se quiser

              // Cards do Tinder
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: cards.isEmpty
                      ? const Center(child: Text('No more cards'))
                      : Stack(children: cards.map(buildUser).toList()),
                ),
              ),

              // Botões de categoria
              CategoryButtonsWidget(
                callback: (value) =>
                    setState(() => this.cards = getCards(value)),
              ),
              const SizedBox(height: 50),
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
            icon: const Icon(Icons.house, color: Colors.purple),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();
              }
            },
          ),
        ),
        actions: [
          Transform.scale(
            scale: 1.6,
            child: Row(children: [
              const Icon(Icons.done_rounded, color: Colors.green),
              Text("$corretas", style: const TextStyle(color: Colors.green)),
              const SizedBox(width: 15),
            ]),
          )
        ],
        leading: Transform.scale(
          scale: 1.6,
          child: Row(children: [
            const SizedBox(width: 15),
            const Icon(Icons.close, color: Colors.red),
            Text("$incorretas", style: const TextStyle(color: Colors.red)),
          ]),
        ),
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

  void onDragEnd(DraggableDetails details, CardGame user) async {
    const minimumDrag = 100;
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
      await playCorrect();
    } else {
      incorretas += 1;
      await playWrong();
    }

    setState(() => cards.remove(user));
  }
}
