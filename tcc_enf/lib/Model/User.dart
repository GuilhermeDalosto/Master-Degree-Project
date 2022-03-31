class User {
  String name;
  String points;
  String imageName;  

  User({required this.name, this.points = "", this.imageName = ""});

  static List<User> generateMock() {
    List<User> users = [
      User(name: "Silvana", points: "1321 pontos", imageName: "player1.jpeg"),
      User(name: "Yuri Barbalho", points: "1063 pontos", imageName: "player2.jpeg"),      
      User(name: "Aline Farias", points: "213 pontos", imageName: "player3.png"),      
    ];

    return users;
  }
}
