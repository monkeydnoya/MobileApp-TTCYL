import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:TTCYL/models/navigationdrawer.dart';
import 'bookdata.dart';
import 'detailpage.dart';

class BookMenu extends StatefulWidget {
  @override
  _BookMenuState createState() => _BookMenuState();
}

class _BookMenuState extends State<BookMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(color: Color.fromRGBO(16, 18, 24, 1.0)),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Биография',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w800)),
                        Text('Жизнь и путь известных людей',
                            style: TextStyle(
                              fontSize: 12,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 450,
                    padding: const EdgeInsets.only(left: 32),
                    child: Swiper(
                        itemCount: books.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 80,
                        layout: SwiperLayout.STACK,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          Detailpage(bookData: books[index])));
                            },
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Container(
                                        width: 200,
                                        height: 400,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 0.1)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    books[index].iconImage),
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text(
                                                    books[index].bookName,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Финансы',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w800)),
                        Text('Жизнь и путь известных людей',
                            style: TextStyle(
                              fontSize: 12,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 450,
                    padding: const EdgeInsets.only(left: 32),
                    child: Swiper(
                        itemCount: finance.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 80,
                        layout: SwiperLayout.STACK,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          FinancePage(
                                              financeData: finance[index])));
                            },
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Container(
                                        width: 200,
                                        height: 400,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 0.1)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    finance[index].iconImage),
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text(
                                                    finance[index].bookName,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Мотивационные книги',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w800)),
                        Text('Жизнь и путь известных людей',
                            style: TextStyle(
                              fontSize: 12,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 450,
                    padding: const EdgeInsets.only(left: 32),
                    child: Swiper(
                        itemCount: motivation.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 80,
                        layout: SwiperLayout.STACK,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          MotivationPage(
                                              motvData: motivation[index])));
                            },
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Container(
                                        width: 200,
                                        height: 400,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 0.1)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    motivation[index]
                                                        .iconImage),
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text(
                                                    motivation[index].bookName,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Книги для души',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w800)),
                        Text('Жизнь и путь известных людей',
                            style: TextStyle(
                              fontSize: 12,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 450,
                    padding: const EdgeInsets.only(left: 32),
                    child: Swiper(
                        itemCount: soul.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 80,
                        layout: SwiperLayout.STACK,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          SoulPage(soulData: soul[index])));
                            },
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Container(
                                        width: 200,
                                        height: 400,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 0.1)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    soul[index].iconImage),
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text(
                                                    soul[index].bookName,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
