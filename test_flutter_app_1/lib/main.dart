import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Title one",
          ),
          centerTitle: true,
          backgroundColor: Colors.red[700]),
      body: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Image.network("https://dartpad.dev/dart-192.png")
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan ,
              child: Text("1"),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.pinkAccent ,
              child: Text("2"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.amber ,
              child: Text("3"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Action Button");
        },
        child: Text("click"),
        backgroundColor: Colors.red[700],
      ),
    );
  }
}
// Flex widths
//
//body: Row(
//children: <Widget>[
//Expanded(
//flex: 3,
//child: Container(
//padding: EdgeInsets.all(30.0),
//color: Colors.cyan ,
//child: Text("1"),
//),
//),
//Expanded(
//flex: 2,
//child: Container(
//padding: EdgeInsets.all(30.0),
//color: Colors.pinkAccent ,
//child: Text("2"),
//),
//),
//Expanded(
//flex: 1,
//child: Container(
//padding: EdgeInsets.all(30.0),
//color: Colors.amber ,
//child: Text("3"),
//),
//)
//],
//),
//
//
//
//body: Column(
//mainAxisAlignment: MainAxisAlignment.start,
//crossAxisAlignment: CrossAxisAlignment.end,
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.all(30.0),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
//children: <Widget>[
//Text("Heading"),
//Text(" One"),
//],
//),
//),
//Padding(
//padding: const EdgeInsets.all(30.0),
//child: Row(
//mainAxisAlignment:  MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Text("Heading"),
//Text(" Two"),
//],
//),
//),
//],
//),
//
//body: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Horizontal
//crossAxisAlignment: CrossAxisAlignment.center,  //  Vertical
//children: <Widget>[
//IconButton(
//icon: Icon(Icons.alternate_email),
//color: Colors.red,
//onPressed: () {
//print("ICON");
//}),
//FlatButton(
//onPressed: () {
//print("Flat Button");
//},
//color: Colors.amber,
//child: Text('Click Me'),
//),
//Container(
//color: Colors.cyan,
//padding: EdgeInsets.all(30.0),
//child: Text(
//"BOX",
//style: TextStyle(
//fontFamily: "PTSerif",
//fontSize: 40.0,
//fontWeight: FontWeight.bold,
//letterSpacing: 2.0,
//color: Colors.black,
//),
//),
//),
//],
//),
//
//body: Padding(
//padding: EdgeInsets.all(40.0),
//child: Text('Hello'),
//),
//
//
//body: Container(  // Creates a single Widget
//margin: EdgeInsets.all(30.0),
//padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//color: Colors.grey[400],
//child: Text(
//"Contained in this container."
//),
//),
//
//
//body: Column(
//children: <Widget>[
//RaisedButton.icon(
//color: Colors.amber[600],
//textColor: Colors.black,
//icon: Icon(
//Icons.adb,
//color: Colors.grey[800],
//size: 70.0,
//),
//label: Text(
//"Button",
//style: TextStyle(
//fontSize: 20.0,
//),
//),
//onPressed: () {
//print("Pressed!");
//},
//onLongPress: () {
//print("Long Pressed!!");
//},
//),
//IconButton(
//icon: Icon(Icons.alternate_email),
//color: Colors.red,
//onPressed: null
//),
//Image.network(
//"http://i0.kym-cdn.com/entries/icons/facebook/000/000/091/TrollFace.jpg",
//alignment: Alignment.bottomCenter,
//),
//Text(
//"cycgojhk",
//style: TextStyle(
//fontFamily: "PTSerif",
//fontSize: 40.0,
//fontWeight: FontWeight.bold,
//letterSpacing: 2.0,
//color: Colors.black,
//),
//),
//],
//),
//)
