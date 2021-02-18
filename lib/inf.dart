import 'package:flutter/material.dart';
import 'package:TTCYL/services/database.dart';

class HomePageC extends StatefulWidget {
  @override
  _HomePageCState createState() => _HomePageCState();
}

class _HomePageCState extends State<HomePageC> {
  final dbhelper = Databasehelper.instance;
  final texteditingcontroller = TextEditingController();
  final texteditCB = TextEditingController();
  bool validated = true;
  String errtext = "";
  String todoedited = "";
  String todoeditedB = "";
  var myitems = List();
  List<Widget> children = new List<Widget>();

  void addtodo() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: todoedited,
      Databasehelper.columnDesciption: todoeditedB,
    };
    final id = await dbhelper.insert(row);
    print(id);
    Navigator.pop(context);
    todoedited = "";
    todoeditedB = "";
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
      children.add(Card(
        elevation: 5.0,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.deepPurple[900]])),
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(row['todoName']),
                    Divider(),
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
        ),
      ));
    });
    return Future.value(true);
  }

  void showalertdialog() {
    texteditingcontroller.text = "";
    texteditCB.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              title: Text(
                "Add Task",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: texteditingcontroller,
                    autofocus: true,
                    onChanged: (_val) {
                      todoedited = _val;
                    },
                    decoration: InputDecoration(
                      errorText: validated ? null : errtext,
                    ),
                  ),
                  TextField(
                    controller: texteditCB,
                    onChanged: (_valB) {
                      todoeditedB = _valB;
                    },
                    decoration: InputDecoration(
                      errorText: validated ? null : errtext,
                    ),
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
                            if (texteditingcontroller.text.isEmpty) {
                              setState(() {
                                errtext = "Can't Be Empty";
                                validated = false;
                              });
                            } else if (texteditingcontroller.text.length >
                                512) {
                              setState(() {
                                errtext = "Too may Chanracters";
                                validated = false;
                              });
                            } else if (texteditCB.text.isEmpty) {
                              setState(() {
                                errtext = "Can't Be Empty to";
                                validated = false;
                              });
                            } else {
                              addtodo();
                            }
                          },
                          color: Colors.purple,
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
            child: Text(
              "No Data",
            ),
          );
        } else {
          if (myitems.length == 0) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.purple,
              ),
              body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/BookMenu.png'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    "No Task Avaliable",
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.grey[900],
                ),
                backgroundColor: Colors.grey[800],
              ),
              body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/BookMenu.png'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
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
