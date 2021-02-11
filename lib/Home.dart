import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Null> _logOut() async {

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Text("well done"),),
          RaisedButton(
            onPressed: _logOut,
            child: new Text('Logout'),
          ),
        ],
      )),
    );
  }
}
