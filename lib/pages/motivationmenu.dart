import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:TTCYL/models/navigationdrawer.dart';
import 'package:TTCYL/pages/motvdata.dart';

import 'detailpage.dart';

class MotvMenu extends StatefulWidget {
  @override
  _MotvMenuState createState() => _MotvMenuState();
}

class _MotvMenuState extends State<MotvMenu> {
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
                        Text('Мотивация',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w800)),
                        Text('Живи так как хочешь',
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
                        itemCount: motiv.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 80,
                        layout: SwiperLayout.STACK,
                        pagination: DotSwiperPaginationBuilder(
                            space: 3, activeColor: Colors.white),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          MotivPage(motivData: motiv[index])));
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
                                                    motiv[index].iconImage),
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                ),
                                                child: Text(motiv[index].name,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 10),
                                                child: Text(
                                                  motiv[index].citate,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.grey),
                                                ),
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
