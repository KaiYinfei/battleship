import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Battleship',
        home: Scaffold(
            body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/battleship.jpg"),
                        fit: BoxFit.cover)),
                child:
                    Stack(
                  children: <Widget>[
                    BackdropFilter(filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(color: Colors.black.withOpacity(.2),)
                  ),
                  SizedBox(
                    height: 300,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/logo.png"),
                        )
                      )
                    )
                  ),

                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 200,
                          height: 50,
                          child: new ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                              onPressed: () {},
                              child: Text('Play'))),
                    )
                    ],
                )
            )
        )
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
    );
  }
}
