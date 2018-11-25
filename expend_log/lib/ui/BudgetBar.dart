import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class BudgetBar extends StatefulWidget {
  final double expendedAmount;
  final double savingAmount;

  const BudgetBar({Key key, this.expendedAmount, this.savingAmount})
      : super(key: key);

  _BudgetBarState createState() => _BudgetBarState();
}

class _BudgetBarState extends State<BudgetBar> {
  double _expendSizeBar = 0.0;
  var maskExpended = new MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',');
  var maskSaving = new MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',');

  void _expendedBar(
      double sizeBar, double expendedAmount, double savingAmount) {
    setState(() {
      _expendSizeBar = sizeBar * expendedAmount / savingAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    maskExpended.updateValue(widget.expendedAmount);
    maskSaving.updateValue(widget.savingAmount);
    //debugPrint("Valor de lo ancho ------");
    //debugPrint(MediaQuery.of(context).size.width.toString());
    _expendedBar(MediaQuery.of(context).size.width, widget.expendedAmount,
        widget.savingAmount);

    return Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize
                  .max, //Espacio que ocupa la columna, solo su contenido min, o expandido max.
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.money_off,
                          color: Colors.grey,
                        ),
                        Text(
                          "Expended:",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    //money_off attach_money
                    Text(
                      "\$ ${maskExpended.text}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          color: Colors.grey,
                        ),
                        Text(
                          "Saving:",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    //money_off attach_money
                    Text(
                      "\$ ${maskSaving.text}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.green, fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 10.0,
            ),
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.green,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Text("")],
                  ),
                ),
                Container(
                  color: Colors.red,
                  width: _expendSizeBar,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Text("")],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
