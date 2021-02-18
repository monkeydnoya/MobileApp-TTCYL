import 'package:flutter/material.dart';

import 'bookdata.dart';
import 'motvdata.dart';

class Detailpage extends StatelessWidget {
  final BookData bookData;

  const Detailpage({Key key, this.bookData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(bookData.iconImage))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(bookData.bookName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Divider(),
                  Container(
                      height: 390,
                      child: ListView(
                        children: <Widget>[Text(bookData.bookDesc)],
                      )),
                ],
              ),
            )));
  }
}

class FinancePage extends StatelessWidget {
  final BookData financeData;

  const FinancePage({Key key, this.financeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(financeData.iconImage))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(financeData.bookName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Divider(),
                  Container(
                      height: 390,
                      child: ListView(
                        children: <Widget>[Text(financeData.bookDesc)],
                      )),
                ],
              ),
            )));
  }
}

class MotivationPage extends StatelessWidget {
  final BookData motvData;

  const MotivationPage({Key key, this.motvData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(motvData.iconImage))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(motvData.bookName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Divider(),
                  Container(
                      height: 390,
                      child: ListView(
                        children: <Widget>[Text(motvData.bookDesc)],
                      )),
                ],
              ),
            )));
  }
}

class SoulPage extends StatelessWidget {
  final BookData soulData;

  const SoulPage({Key key, this.soulData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(soulData.iconImage))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(soulData.bookName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Divider(),
                  Container(
                      height: 390,
                      child: ListView(
                        children: <Widget>[Text(soulData.bookDesc)],
                      )),
                ],
              ),
            )));
  }
}

class MotivPage extends StatelessWidget {
  final MotvData motivData;

  const MotivPage({Key key, this.motivData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(motivData.iconImage))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(motivData.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Divider(),
                  Container(
                      height: 500,
                      child: ListView(
                        children: <Widget>[Text(motivData.story)],
                      )),
                ],
              ),
            )));
  }
}
