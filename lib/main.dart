//import 'dart:js_util/js_util_wasm.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_forecast/api_service.dart';
import 'package:intl/intl.dart';
//import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    title: 'Weather forecast',
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  CurrentWeather? _currentWeather = null;
  DayWeather? _dayWeather = null;
  @override
  void initState() {
    super.initState();
    _getData();

  }

  void _getData() async {
    _currentWeather = (await ApiServiceCurrentWeather().getCurrentWeather());
    _dayWeather = (await ApiServiceDayWeather().getDayWeather());
    Future.delayed(const Duration(milliseconds: 500)).then((value) => setState(() {}));
  }

  String _getPictureCur() {
    return (_currentWeather?.weather[0].icon).toString();
  }

  String _getPictureDay() {
    return (_dayWeather?.list[0].weather[0].icon).toString();
  }

  int _getHour() {
    var date = (_dayWeather?.list[0].dtTxt.toString() ?? 0).toString();
    return int.parse(date.substring(11, 13));
    // var date = (_dayWeather?.list[0].dtTxt ?? 0);
    // DateFormat format = new DateFormat("yyyy-MM-dd HH:mm:ss");
    // date = format.parse(date.toString()) as String;
    // return int.parse(DateFormat.HOUR24);
  }

  Widget _weatherRightNow(double degree, double feelsLikeDegree) => Row(
        children: [
          Image.asset(
            'assets/images/' + _getPictureCur() + '.png',
            height: 100,
            width: 100,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ((degree.toDouble()).round()).toString() + '°C',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    fontFamily: 'Times New Roman'),
              ),
              Text(
                'Feels like ' + (feelsLikeDegree.toDouble().round()).toString() + '°C',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman'),
              ),
            ],
          ),
        ],
      );

  Widget _weatherDay(double degree, int time) => Column(
        children: [
          Container(
            child: Text(
              degree.round().toString() + '°C',
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

  Widget _weatherWeek(String weekday, double degree) => Row(
        children: [
          Image.asset(
            'assets/images/' + _getPictureDay() + '.png',
            height: 40,
            width: 40,
          ),
          Text(
            weekday,
            style: TextStyle(fontFamily: 'Times New Roman'),
          ),
          Container(
            child: Text(
              degree.round().toString() + '°C',
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
            padding: const EdgeInsets.all(5.0),
            constraints: const BoxConstraints.tightForFinite(width: 160, height: 40),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather forecast'),
      ),
      body: Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const Text(
                  'Right Now',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: 'Times New Roman'),
                  textAlign: TextAlign.left,
                ),
                ElevatedButton(
                    child: Text('Choose location'),
                    //Image.asset('assets/images/location.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationPage()));
                    }),
              ]),
              _weatherRightNow(_currentWeather?.main.temp ?? 0  , _currentWeather?.main.feelsLike.toDouble() ?? 0.0),
              Column(children: [
                const Text(
                  'This Day',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: 'Times New Roman'),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    _weatherDay(_dayWeather?.list[0].main.temp ?? 0, (_getHour()) % 24),
                    _weatherDay(_dayWeather?.list[1].main.temp ?? 0, (_getHour() + 3) % 24),
                    _weatherDay(_dayWeather?.list[2].main.temp ?? 0, (_getHour() + 6) % 24),
                    _weatherDay(_dayWeather?.list[3].main.temp ?? 0, (_getHour() + 9) % 24),
                    _weatherDay(_dayWeather?.list[4].main.temp ?? 0, (_getHour() + 12) % 24),
                    _weatherDay(_dayWeather?.list[5].main.temp ?? 0, (_getHour() + 15) % 24),
                    _weatherDay(_dayWeather?.list[6].main.temp ?? 0, (_getHour() + 18) % 24),
                    _weatherDay(_dayWeather?.list[7].main.temp ?? 0, (_getHour() + 21) % 24),
                  ],
                )
              ]),
              Column(children: [
                Text('This Week',
                    style: const TextStyle(
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
                      ],
                    ),
                  ],
                )
              ]),
            ],
          )),
    );
  }
}

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}
class _LocationPageState extends State<LocationPage> {
  final List<String> cities = ["Omsk", "Tumen", "Samara", "Kurgan", "Kaliningrad"];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose location'),
        ),
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: _createListView,
          ))
        ])
    );
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;

        });
      },
      child: Container(
        alignment: Alignment.centerLeft,
          height: 50,
          decoration: BoxDecoration(
            color: index == selectedIndex ? Colors.grey: Colors.white,
            border: Border.all(width: 1, color: Colors.grey),
          ),
          padding: const EdgeInsets.all(5.0),
          child: Text(
            cities[index],
            style: TextStyle(fontSize: 26, fontFamily: 'Times New Roman'),
          ),
      ),
    );
  }
}


