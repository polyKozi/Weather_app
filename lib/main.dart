import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_forecast/api_service.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter_easyrefresh/easy_refresh.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Weather forecast',
    home: HomePage(),
  ));
}

int cityIndex = 0;
final List<String> cities = [
  "Omsk",
  "Tumen",
  "Samara",
  "Kurgan",
  "Kaliningrad"
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final GlobalKey<_HomePage> _refreshIndicatorKey = GlobalKey<_HomePage>();

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
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => setState(() {}));
  }

  String _getPictureCur() {
    return (_currentWeather?.weather[0].icon).toString();
  }

  String _getPictureDay(index) {
    return (_dayWeather?.list[index].weather[0].icon).toString();
  }

  int _getWeekDay() {
    return DateTime.now().weekday.toInt();
  }

  var weekDays = {
    0: "SUN",
    1: "MON",
    2: "TUE",
    3: "WED",
    4: "THU",
    5: "FRI",
    6: "SAT"
  };

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
                degree.round().toString() + '°C',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    fontFamily: 'Times New Roman'),
              ),
              Text(
                'Feels like ' + feelsLikeDegree.round().toString() + '°C',
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
            constraints: BoxConstraints.tightForFinite(
                width: 40,
                height: 160 / 100 * (degree * 4).round().toInt().abs()),
          ),
          Text(
            time.toString() + ':00',
            style: TextStyle(fontFamily: 'Times New Roman'),
          ),
        ],
      );

  Widget _weatherWeek(String weekday, double degree, int index) => Row(
        children: [
          Image.asset(
            'assets/images/' + _getPictureDay(index) + '.png',
            height: 40,
            width: 40,
          ),
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.tightForFinite(width: 40, height: 20),
            child: Text(
              weekday,
              style: TextStyle(fontFamily: 'Times New Roman'),
            ),
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
            constraints: BoxConstraints.tightForFinite(
                width: 160 / 100 * (degree * 4).round().toInt().abs(),
                height: 40),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather forecast'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.blue,
        strokeWidth: 4.0,
        onRefresh: () async {
          //return Future<void>.delayed(const Duration(seconds: 3));
          return Future.delayed(const Duration(milliseconds: 500))
              .then((value) => setState(() {}));
        },
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Container(
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
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
                                                builder: (context) =>
                                                    LocationPage()));
                                      }),
                                ]),
                            _weatherRightNow(
                                _currentWeather?.main.temp.toDouble() ?? 0.0,
                                _currentWeather?.main.feelsLike.toDouble() ??
                                    0.0),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'This Day',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        fontFamily: 'Times New Roman'),
                                    textAlign: TextAlign.left,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      _weatherDay(
                                          _dayWeather?.list[0].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          (_getHour()) % 24),
                                      _weatherDay(
                                          _dayWeather?.list[1].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          (_getHour() + 3) % 24),
                                      _weatherDay(
                                          _dayWeather?.list[2].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          (_getHour() + 6) % 24),
                                      _weatherDay(
                                          _dayWeather?.list[3].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          (_getHour() + 9) % 24),
                                      _weatherDay(
                                          _dayWeather?.list[4].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          (_getHour() + 12) % 24),
                                      _weatherDay(
                                          _dayWeather?.list[5].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          (_getHour() + 15) % 24),
                                      _weatherDay(
                                          _dayWeather?.list[6].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          (_getHour() + 18) % 24),
                                      _weatherDay(
                                          _dayWeather?.list[7].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          (_getHour() + 21) % 24),
                                    ],
                                  )
                                ]),
                            Column(children: [
                              Container(
                                constraints: BoxConstraints.tightForFinite(
                                    width: 200, height: 60),
                                alignment: Alignment.center,
                                child: Text('This Week',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        fontFamily: 'Times New Roman'),
                                    textAlign: TextAlign.left),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _weatherWeek(
                                          weekDays[_getWeekDay()].toString(),
                                          _dayWeather?.list[0].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          0),
                                      _weatherWeek(
                                          weekDays[(_getWeekDay() + 1) % 7]
                                              .toString(),
                                          _dayWeather?.list[7].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          7),
                                      _weatherWeek(
                                          weekDays[(_getWeekDay() + 2) % 7]
                                              .toString(),
                                          _dayWeather?.list[15].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          15),
                                      _weatherWeek(
                                          weekDays[(_getWeekDay() + 3) % 7]
                                              .toString(),
                                          _dayWeather?.list[31].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          31),
                                      _weatherWeek(
                                          weekDays[(_getWeekDay() + 4) % 7]
                                              .toString(),
                                          _dayWeather?.list[39].main.temp
                                                  .toDouble() ??
                                              0.0,
                                          39),
                                    ],
                                  ),
                                ],
                              )
                            ]),
                          ],
                        ))));
          },
        ),
      ),
    );
  }
}

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose location'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: _createListView,
          ))
        ]));
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          cityIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        decoration: BoxDecoration(
          color: index == selectedIndex ? Colors.grey : Colors.white,
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
