import 'package:flutter/material.dart';
import 'package:TTCYL/models/navigationdrawer.dart';

class SettingsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(color: Color.fromRGBO(16, 18, 24, 1.0)),
          child: Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('О приложений',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
                Divider(),
                Container(
                    height: 250,
                    child: ListView(
                      children: <Widget>[
                        Text(
                            'Стиль, дизайн, опыт, желание создать продукт которым сам пользовался бы - это все приложение TTCYL.  Я больше чем уверен что именно это приложение, нет строки кода пропущенные через призму своего опыта помогут тебе найти свои путь и не скатится из тяжелой но и интересной дороги жизни. Книги и историй людей описанные в этом приложений составлены прежде всего ориентируясь на потребителя, а не на просто громкие названия. Приложение на стадий Beta тестирования и если ты считаешь что у тебя есть идеи которые улучшали бы его, то я жду отзывы от тебя. Мне очень важно создать продукт который не просто будет мегабайтами данных на твоем смартфоне, а будет стимулом делать хоть какие-то шаги и не пропустить самые приятные моменты жизни. Time To Change Your Life v0.0.1(Beta)!',
                            style: TextStyle(fontSize: 15))
                      ],
                    )),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.email),
                    SizedBox(
                      width: 15,
                    ),
                    Text('ttcylapp@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 15))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.phone),
                    SizedBox(width: 20),
                    Text('+7 707 781 4945',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w100)),
                  ],
                ),
                SizedBox(height: 120),
                Text(
                  'Time To Change Your Life!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Text(
                  'work while other rest',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
