import 'package:flutter/material.dart';
//import 'package:hello_world/nowPlaying.dart';
import 'home.dart';
import 'global.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //print(x[1]);
    getSongs();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

// void main() {
//   runApp(new MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new MyHomePage(/*"tom","csa","assets/tom.jpg",Colors.blue*/),
//     );
//   }
// }