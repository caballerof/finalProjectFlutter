import 'package:flutter/material.dart';

class LogingArea extends StatefulWidget {
  _LogingAreaState createState() => _LogingAreaState();
}

class _LogingAreaState extends State<LogingArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 5.0,
            ),
            child: new Stack(
              children: <Widget>[
                Container(
                  height: 120.0,
                  margin: new EdgeInsets.only(left: 46.0),
                  decoration: new BoxDecoration(
                    color: new Color(0xFF607C98),
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(8.0),
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 60.0, top: 40.0),
                    padding: EdgeInsets.only(right: 40.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "FJ Caballero",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("csoft@email.com",
                            style: TextStyle(color: Colors.white54))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 16.0),
                  alignment: FractionalOffset.centerLeft,
                  child: new Image(
                    image: new AssetImage("images/man.png"),
                    height: 92.0,
                    width: 92.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
