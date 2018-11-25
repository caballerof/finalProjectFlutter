import 'package:flutter/material.dart';
import 'BudgetBar.dart';
import 'CardSpending.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'LoginArea.dart';
import 'CountsPage.dart';

class FirstPage extends StatefulWidget {
  final String appName;
  final DateTime date;
  const FirstPage({Key key, this.appName, this.date}) : super(key: key);

  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  DateTime _selectedDate = new DateTime.now();

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019));
    //if (picked != null) setState(() => debugPrint(picked.toString()));
    if (picked != null) setState(() => _selectedDate = picked);
  }

  _addDate() {
    setState(() {
      _selectedDate = _selectedDate.add(new Duration(days: 1));
    });
  }

  _lessDate() {
    setState(() {
      _selectedDate = _selectedDate.add(new Duration(days: -1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF34404A),
        title: Row(
          children: <Widget>[
            IconButton(
              icon: new Icon(Icons.arrow_left),
              color: Colors.white,
              onPressed: _lessDate,
              iconSize: 40.0,
            ),
            InkWell(
              child: Text(new DateFormat('dd/MM/yyyy').format(_selectedDate),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                  )),
              onTap: _selectDate,
            ),
            IconButton(
              icon: new Icon(Icons.arrow_right),
              color: Colors.white,
              onPressed: _addDate,
              iconSize: 40.0,
            )
          ],
        ),
      ),
      drawer: new Drawer(
        child: Container(
          decoration: BoxDecoration(color: Color(0xFF607C98)),
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                child: LogingArea(),
                decoration: new BoxDecoration(color: Color(0xFF34404A)),
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xFF607C98)),
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.pie_chart,
                        color: Colors.orange,
                      ),
                      Text("  Reportes",
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.0)),
                    ],
                  ),
                  onTap: () => debugPrint("Opt 1 ----"),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xFF607C98)),
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        color: Colors.cyan,
                      ),
                      Text("  Presupuesto",
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.0)),
                    ],
                  ),
                  onTap: () => debugPrint("Opt 2 ----"),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xFF607C98)),
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.line_style,
                        color: Colors.yellow,
                      ),
                      Text("  Categorias",
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.0)),
                    ],
                  ),
                  onTap: () => debugPrint("Opt 3 ----"),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xFF607C98)),
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.credit_card,
                        color: Colors.green,
                      ),
                      Text("  Cuentas",
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.0)),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new CountsPage()));
                  },
                ),
              ),
              AboutListTile(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.red,
                ),
                applicationIcon: Icon(
                  Icons.mode_edit,
                  color: Colors.greenAccent,
                ),
                applicationName: "Registro de gastos",
                applicationVersion: "0.0.1",
                aboutBoxChildren: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.person_outline,
                        color: Colors.blue,
                      ),
                      Text("FJ Caballero"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.pool,
                        color: Colors.green,
                      ),
                      Text("Just keep swimming!"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection("expenses")
              .where('date',
                  isEqualTo: new DateFormat('dd/MM/yyyy').format(_selectedDate))
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading...");
            }
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) => CardSpending(
                      context: context,
                      amount: snapshot.data.documents[index]["amount"],
                      account: snapshot.data.documents[index]["account"],
                      category: snapshot.data.documents[index]["category"],
                      date: snapshot.data.documents[index]["date"],
                      icon: snapshot.data.documents[index]["icon"],
                      subCategory: snapshot.data.documents[index]
                          ["sub_category"],
                      type: snapshot.data.documents[index]["type"],
                    ));
          },
        ),
      ),
      backgroundColor: Color(0xFF607C98),
      bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Color(0xFF34404A),
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Color(0xFF01B7C3),
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))),
          child: BottomNavigationBar(
            currentIndex: 0, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.today),
                title: new Text('Dia'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.date_range),
                title: new Text('Semana'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.event_note), title: Text('Mes'))
            ],
          )),
    );
  }

  _buildListItem(BuildContext context, DocumentSnapshot item) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              item["category"],
              style: TextStyle(color: Colors.blue, fontSize: 16.0),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(color: Colors.greenAccent.shade400),
            child: Text(
              item["amount"].toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          )
        ],
      ),
    );
  } //End _buildListItem

} //End Class
