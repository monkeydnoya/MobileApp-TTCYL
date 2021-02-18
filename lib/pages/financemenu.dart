import 'package:flutter/material.dart';
import 'package:TTCYL/models/navigationdrawer.dart';
import 'package:TTCYL/services/financedb.dart';

class FinanceMenu extends StatefulWidget {
  @override
  _FinanceMenuState createState() => _FinanceMenuState();
}

class _FinanceMenuState extends State<FinanceMenu> {
  final dbhelper = Financedatabase.instance;
  final dataEditing = TextEditingController();
  final foodEditing = TextEditingController();
  final transportEditing = TextEditingController();
  final clothesEditing = TextEditingController();
  final otherEditing = TextEditingController();
  bool validated = true;
  String errtext = '';
  String dataEdited = '';
  String foodEdited = '';
  String transportEdited = '';
  String clothesEdited = '';
  String otherEdited = '';
  var myitems = List();
  List<Widget> children = new List<Widget>();

  void addtodo() async {
    var food = int.parse(foodEdited);
    var transport = int.parse(transportEdited);
    var clothes = int.parse(clothesEdited);
    var other = int.parse(otherEdited);
    int summ = food + transport + clothes + other;
    print(summ);
    Map<String, dynamic> row = {
      Financedatabase.columnData: dataEdited,
      Financedatabase.columnFood: foodEdited,
      Financedatabase.columnTransport: transportEdited,
      Financedatabase.columnClothes: clothesEdited,
      Financedatabase.columnOther: otherEdited,
      Financedatabase.columnSum: summ,
    };
    final id = await dbhelper.insert(row);
    print(id);
    Navigator.pop(context);
    dataEdited = '';
    foodEdited = "";
    transportEdited = "";
    clothesEdited = "";
    otherEdited = "";
    summ = 0;
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
                        Text('Потрачено на ${row['data']} - ${row['summ']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18)),
                        SizedBox(),
                        Text('Еда: ${row['food']}'),
                        Text('Транспорт: ${row['transport']}'),
                        Text('Одежда: ${row['clothes']}'),
                        Text('Прочее: ${row['other']}'),
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
    dataEditing.text = "";
    foodEditing.text = "";
    clothesEditing.text = "";
    otherEditing.text = "";
    transportEditing.text = "";
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
              content: ListView(
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: dataEditing,
                    autofocus: true,
                    onChanged: (_val) {
                      dataEdited = _val;
                    },
                    decoration: InputDecoration(
                        errorText: validated ? null : errtext,
                        labelText: 'Укажите дату'),
                  ),
                  TextField(
                    controller: foodEditing,
                    autofocus: true,
                    onChanged: (_val) {
                      foodEdited = _val;
                    },
                    decoration: InputDecoration(
                        errorText: validated ? null : errtext,
                        labelText: 'Еда'),
                  ),
                  TextField(
                    controller: transportEditing,
                    onChanged: (_valB) {
                      transportEdited = _valB;
                    },
                    decoration: InputDecoration(
                        errorText: validated ? null : errtext,
                        labelText: 'Транспорт'),
                  ),
                  TextField(
                    controller: clothesEditing,
                    autofocus: true,
                    onChanged: (_val) {
                      clothesEdited = _val;
                    },
                    decoration: InputDecoration(
                        errorText: validated ? null : errtext,
                        labelText: 'Одежда'),
                  ),
                  TextField(
                    controller: otherEditing,
                    autofocus: true,
                    onChanged: (_val) {
                      otherEdited = _val;
                    },
                    decoration: InputDecoration(
                        errorText: validated ? null : errtext,
                        labelText: 'Прочее'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: addtodo,
                          elevation: 0,
                          color: Color.fromRGBO(16, 18, 24, 1.0),
                          child: Text("Sum"),
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
                  color: Color.fromRGBO(16, 18, 24, 1.0),
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
