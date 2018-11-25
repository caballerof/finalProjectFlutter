import 'package:flutter/material.dart';

class CardSpending extends StatefulWidget {
  final int amount;
  final String account;
  final String category;
  final String subCategory;
  final String date;
  final String icon;
  final BuildContext context;
  final String type;

  const CardSpending({
    Key key,
    this.context,
    this.amount,
    this.account,
    this.category,
    this.subCategory,
    this.date,
    this.icon,
    this.type,
  });

  _CardSpendingState createState() => _CardSpendingState();
}

class _CardSpendingState extends State<CardSpending> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 0.0),
        child: Card(
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: 52.0,
                        maxWidth: 5.0,
                        minHeight: 52.0,
                        minWidth: 5.0),
                    color: widget.type == "expense"
                        ? Colors.red.shade400
                        : Colors.green.shade400,
                    child: null,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3.0),
                    child: Image.asset(
                      'icons/${widget.icon}.png',
                      height: 32.0,
                      width: 32.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text("${widget.category}",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.body2),
                          Text(
                            "${widget.subCategory}",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    child: Text(
                      widget.date,
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    child: Image.asset(
                      'icons/${widget.account}.png',
                      height: 24.0,
                      width: 24.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                    child: Text(
                      "\$ ${widget.amount}",
                      style: Theme.of(context).textTheme.body2,
                    ),
                  )
                ],
              ),
              /*
              Positioned(
                  left: 0.0,
                  top: 7.0,
                  child: Container(
                    child: Image.asset(
                      'icons/beer.png',
                      height: 38.0,
                      width: 38.0,
                    ),
                  ))
                  */
            ],
          ),
        ));
  }
}
