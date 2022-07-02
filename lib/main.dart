import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  Widget _weatherRightNow(String degree, String feelsLikeDegree) => Row(
        children: [
          Image.asset(
            'assets/images/meteotrend_sun_and_cloud2.png',
            height: 100,
            width: 100,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(degree, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45, fontFamily: 'Times New Roman'),),
              Text(feelsLikeDegree, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontFamily: 'Times New Roman'),),
            ],
          ),
        ],
      );

  Widget _weatherDay(String degree, String time) => Column(
        children: [
          Container(
            child: Text(degree, style: TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Times New Roman'),),
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(width: 1, color: Colors.teal),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            ),
            margin: const EdgeInsets.all(2.0),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(5.0),
            constraints: BoxConstraints.tightForFinite(width: 40, height: 160),
          ),
          Text(time, style: TextStyle(fontFamily: 'Times New Roman'),),
        ],
      );

  Widget _weatherWeek(String weekday, String degree) => Row(
        children: [
          Image.asset(
            'assets/images/meteotrend_sun_and_cloud2.png',
            height: 40,
            width: 40,
          ),
          Text(weekday, style: TextStyle(fontFamily: 'Times New Roman'),),
          Container(
            child: Text(degree, style: TextStyle(color: Colors.white, fontSize: 26, fontFamily: 'Times New Roman'),),
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
        title: _title,
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
                  Text('Right Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, fontFamily: 'Times New Roman'), textAlign: TextAlign.left,),
                  _weatherRightNow('17°C', 'feels like 18°C'),
                  Column(children: [
                    Text('This Day', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, fontFamily: 'Times New Roman'), textAlign: TextAlign.left,),
                    Row(
                      children: [
                        _weatherDay('16°C', '10:00'),
                        _weatherDay('17°C', '11:00'),
                        _weatherDay('15°C', '12:00'),
                        _weatherDay('15°C', '13:00'),
                        _weatherDay('17°C', '14:00'),
                        _weatherDay('19°C', '15:00'),
                      ],
                    )
                  ]),
                  Column(
                      children: [
                    Text('This Week', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, fontFamily: 'Times New Roman'), textAlign: TextAlign.left),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            _weatherWeek('MON', '15°C'),
                            _weatherWeek('TUE', '13°C'),
                            _weatherWeek('WED', '19°C'),
                            _weatherWeek('THU', '17°C'),
                            _weatherWeek('FRI', '16°C'),
                            _weatherWeek('SAT', '20°C'),
                            _weatherWeek('SUN', '16°C'),
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
