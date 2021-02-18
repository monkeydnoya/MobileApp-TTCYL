import 'package:flutter/material.dart';
import 'package:TTCYL/models/colors.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(color: backgrColor),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Padding(
              padding:
                  EdgeInsets.only(top: 50, bottom: 30, left: 15, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "TTCYL",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "ttcylapp@gmail.com",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            )),
            Divider(),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.menu),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Главная", style: TextStyle(fontSize: 16))
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                }),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.transform),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Цели", style: TextStyle(fontSize: 16))
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                }),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.memory),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Книги", style: TextStyle(fontSize: 16))
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                }),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Личные Финансы", style: TextStyle(fontSize: 16))
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/finance');
                }),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.filter_hdr),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Истории успеха", style: TextStyle(fontSize: 16))
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/fourth');
                }),
            Divider(),
            FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.question_answer),
                    SizedBox(
                      width: 5,
                    ),
                    Text("О приложений", style: TextStyle(fontSize: 16))
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                })
          ],
        ),
      ),
    ));
  }
}
