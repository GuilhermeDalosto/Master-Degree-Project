class CardGame {
  final String name;
  final String image;
  bool isLiked;
  bool isSwipedOff;

  CardGame({
    required this.name,
    required this.image,
    this.isLiked = false,
    this.isSwipedOff = false,
  });
}