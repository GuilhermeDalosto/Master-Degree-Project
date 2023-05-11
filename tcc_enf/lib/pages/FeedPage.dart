import 'package:flutter/material.dart';

import 'LoginPage.dart';

class InstaList extends StatefulWidget {
  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  bool isPressed = false;
  var titles = ["Códigos de ética", "Códigos de ética", "SAE e PE", "SAE e PE", "SAE E PE"];
  var images = ["res/feedImage1.png", "res/feedImage2.png","res/feedImage3.png","res/feedImage4.png","res/feedImage5.png"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage('res/player4.jpeg'))),
                        )),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text(
                      titles[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                new IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: null,
                )
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill, image: new AssetImage(images[index]))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      icon: new Icon(
                          isPressed ? Icons.favorite : Icons.favorite_border),
                      color: isPressed ? Colors.red : Colors.black,
                    ),
                    new SizedBox(
                      width: 16.0,
                    ),
                    new Icon(Icons.comment),
                    new SizedBox(
                      width: 16.0,
                    ),
                    new Icon(Icons.send),
                  ],
                ),
                new Icon(Icons.bookmark)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Curtido por futuraenfermeiraunb",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage('res/player4.jpeg'))),
                ),
                new SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: new TextField(
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add a comment...",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Postado em fevereiro de 2022", style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
