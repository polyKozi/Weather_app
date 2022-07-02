import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget _weatherRightNow(int degree, int feelsLikeDegree) => Row(
        children: [
          Image.asset(
            'assets/images/meteotrend_sun_and_cloud2.png',
            height: 100,
            width: 100,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                degree.toString() + '°C',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    fontFamily: 'Times New Roman'),
              ),
              Text(
                'Feels like' + feelsLikeDegree.toString() + '°C',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman'),
              ),
            ],
          ),
        ],
      );

  Widget _weatherDay(int degree, int time) => Column(
        children: [
          Container(
            child: Text(
              degree.toString() + '°C',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'Times New Roman'),
            ),
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(width: 1, color: Colors.teal),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            ),
            margin: const EdgeInsets.all(2.0),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(5.0),
            constraints: BoxConstraints.tightForFinite(width: 45, height: 160),
          ),
          Text(
            time.toString() + ':00',
            style: TextStyle(fontFamily: 'Times New Roman'),
          ),
        ],
      );

  Widget _weatherWeek(String weekday, int degree) => Row(
        children: [
          Image.asset(
            'assets/images/meteotrend_sun_and_cloud2.png',
            height: 40,
            width: 40,
          ),
          Text(
            weekday,
            style: TextStyle(fontFamily: 'Times New Roman'),
          ),
          Container(
            child: Text(
              degree.toString() + '°C',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'Times New Roman'),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              border: Border.all(width: 1, color: Colors.deepPurple),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5)),
            ),
            margin: const EdgeInsets.all(2.0),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(5.0),
            constraints: BoxConstraints.tightForFinite(width: 160, height: 40),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Weather forecast'),
          ),
          body: Container(
              alignment: Alignment.topLeft,
              //width: 200,
              //height: 200,
              child: Column(
                children: [
                  Text(
                    'Right Now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        fontFamily: 'Times New Roman'),
                    textAlign: TextAlign.left,
                  ),
                  _weatherRightNow(17, 18),
                  Column(children: [
                    Text(
                      'This Day',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          fontFamily: 'Times New Roman'),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        _weatherDay(16, 10),
                        _weatherDay(17, 11),
                        _weatherDay(15, 12),
                        _weatherDay(15, 13),
                        _weatherDay(17, 14),
                        _weatherDay(19, 15),
                        _weatherDay(19, 16),
                        _weatherDay(19, 17),
                      ],
                    )
                  ]),
                  Column(children: [
                    Text('This Week',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            fontFamily: 'Times New Roman'),
                        textAlign: TextAlign.left),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            _weatherWeek('MON', 15),
                            _weatherWeek('TUE', 13),
                            _weatherWeek('WED', 19),
                            _weatherWeek('THU', 17),
                            _weatherWeek('FRI', 16),
                            _weatherWeek('SAT', 20),
                            _weatherWeek('SUN', 16),
                          ],
                        ),
                      ],
                    )
                  ]),
                ],
              )),
        ));
  }
}
