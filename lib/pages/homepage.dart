import 'package:flutter/material.dart';
import 'package:TTCYL/models/navigationdrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(color: Color.fromRGBO(16, 18, 24, 1.0)),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Если ты сейчас читаешь это, то посмотри список самых богатых людей. Если тебя там нет – берись за работу',
                        style: TextStyle(color: Colors.white.withOpacity(1))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Путь в тысячу миль начинается с одного-единственного маленького шага',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Каждому человеку судьба нальет столько литров удачи, сколько поместится в бензобак его смелости',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Не прекращай вкладывать в развитие. Никогда не прекращай совершенствоваться. Никогда не прекращай обновляться. Момент, когда ты прекратишь совершенствовать свою организацию, будет началом её конца. Поставь цель: каждый день становиться лучше, хотя бы чуть-чуть. Запомни японскую стратегию Кайдзен. Маленькие ежедневные улучшения принесут, в конце концов, большие преимущества.',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Чтобы извлечь из жизни максимум, человек должен уметь изменяться. К сожалению, человек изменяется с большим трудом, и изменения эти происходят очень медленно. Многие тратят на это годы. Самым трудным является по-настоящему захотеть измениться.',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Жизнь — это либо рискованное приключение, либо пустота',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Только одно делает исполнение мечты невозможным — страх неудачи.',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Сделай первый шаг и ты поймешь, что не все так страшно',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Делай что можешь, с тем, что у тебя есть, там, где ты находишься.',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Решение создает действие. Действия создают привычку. Привычка создает характер. Характер создает судьбу.',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Просыпаясь утром, спроси себя: «Что я должен сделать?». Вечером, прежде чем заснуть: «Что я сделал?».',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Знания недостаточно, необходимо применение. Желания недостаточно, необходимо действие',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Каждый вечер записывайте на бумаге шесть самых важных вещей, которые Вам необходимо сделать завтра. Пока Вы спите подсознание проведет всю необходимую работу и определит, каким образом их можно сделать самым лучшим способом. И Ваш новый день будет гораздо более продуктивным.',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                        'Если я работаю по четырнадцать часов в день и семь дней в неделю, то мне определенно начинает везти.',
                        style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Divider(),
                    Text(
                      'Time To Change Your Life!',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'work while other rest',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    OutlineButton(
                      child: Text('Цели на день'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                      highlightedBorderColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        drawer: NavDrawer());
  }
}
