import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CountsPage extends StatefulWidget {
  _CountsPageState createState() => _CountsPageState();
}

class _CountsPageState extends State<CountsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF34404A),
        title: Text("Cuentas"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("accounts").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text("Cargando...");
            }
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) => Card(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'icons/${snapshot.data.documents[index]["icon"]}.png',
                              height: 32.0,
                              width: 32.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.0),
                            ),
                            Text(
                              "${snapshot.data.documents[index]["name"]}",
                              style: Theme.of(context).textTheme.title,
                            )
                          ],
                        ),
                      ),
                    ));
          },
        ),
      ),
      backgroundColor: Color(0xFF607C98),
    );
  }
}
