import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:TTCYL/models/colors.dart';
import 'package:TTCYL/models/navigationdrawer.dart';
import 'package:TTCYL/services/database.dart';

class Todolistmenu extends StatefulWidget {
  @override
  _TodolistmenuState createState() => _TodolistmenuState();
}

class _TodolistmenuState extends State<Todolistmenu> {
  final dbhelper = Databasehelper.instance;
  final titleedidintCntrl = TextEditingController();
  final desceditingCntrl = TextEditingController();
  bool validated = true;
  String errtext = '';
  String titleEdited = '';
  String descEdited = '';
  var myitems = List();
  List<Widget> children = new List<Widget>();

  void addtodo() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: titleEdited,
      Databasehelper.columnDesciption: descEdited,
    };
    final id = await dbhelper.insert(row);
    print(id);
    Navigator.pop(context);
    titleEdited = "";
    descEdited = "";
    setState(() {
      validated = true;
      errtext = "";
    });
  }

  Future<bool> query() async {
    myitems = [];
    children = [];
    var allrows = await dbhelper.queryall();
    allrows.forEach((row) {
      myitems.add(row.toString());
      children.add(Container(
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(16, 18, 24, 1.0),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Divider(),
              Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(row['todoName'],
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(row['todoDescription'])
                      ],
                    ),
                  ),
                  SizedBox(width: 50),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 20,
                          ),
                          onPressed: () {
                            dbhelper.deletedata(row['id']);
                            setState(() {});
                          })
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
    });
    return Future.value(true);
  }

  void showalertdialog() {
    titleedidintCntrl.text = "";
    desceditingCntrl.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Color.fromRGBO(16, 18, 24, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              title: Center(
                child: Text(
                  "Добавить цель",
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: titleedidintCntrl,
                    autofocus: true,
                    onChanged: (_val) {
                      titleEdited = _val;
                    },
                    decoration: InputDecoration(
                        errorText: validated ? null : errtext,
                        labelText: 'Цель'),
                  ),
                  TextField(
                    controller: desceditingCntrl,
                    onChanged: (_valB) {
                      descEdited = _valB;
                    },
                    decoration: InputDecoration(
                        errorText: validated ? null : errtext,
                        labelText: 'Описание цели'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (titleedidintCntrl.text.isEmpty) {
                              setState(() {
                                errtext = "Can't Be Empty";
                                validated = false;
                              });
                            } else if (titleedidintCntrl.text.length > 512) {
                              setState(() {
                                errtext = "Too may Chanracters";
                                validated = false;
                              });
                            } else if (desceditingCntrl.text.isEmpty) {
                              setState(() {
                                errtext = "Can't Be Empty to";
                                validated = false;
                              });
                            } else {
                              addtodo();
                            }
                          },
                          elevation: 0,
                          color: Color.fromRGBO(16, 18, 24, 1.0),
                          child: Text("ADD"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text("No Data"),
          );
        } else {
          if (myitems.length == 0) {
            return Scaffold(
              drawer: NavDrawer(),
              bottomNavigationBar: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        }),
                    SizedBox(
                      width: 100,
                    ),
                    Text('TTCYL'),
                    SizedBox(
                      width: 100,
                    ),
                    IconButton(
                        icon: Icon(Icons.add), onPressed: showalertdialog)
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 18, 24, 1.0),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
              ),
              backgroundColor: Color.fromRGBO(16, 18, 24, 1.0),
              body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: backgrColor,
                ),
              ),
            );
          } else {
            return Scaffold(
              drawer: NavDrawer(),
              bottomNavigationBar: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        }),
                    SizedBox(
                      width: 100,
                    ),
                    Text('TTCYL'),
                    SizedBox(
                      width: 100,
                    ),
                    IconButton(
                        icon: Icon(Icons.add), onPressed: showalertdialog)
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 18, 24, 1.0),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
              ),
              backgroundColor: Color.fromRGBO(16, 18, 24, 1.0),
              body: Container(
                constraints: BoxConstraints.expand(),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: children,
                    ),
                  ),
                ),
              ),
            );
          }
        }
      },
      future: query(),
    );
  }
}
