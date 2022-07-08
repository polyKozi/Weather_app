import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_forecast/api_service.dart';
import 'dart:async';
import 'package:weather_forecast/models.dart';
import 'package:weather_forecast/styles.dart';

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

  int selectedIndex = -1;

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
                degree.round().toString() + '°',
                style: TitleStyle,
              ),
              Text(
                'Feels like ' + feelsLikeDegree.round().toString() + '°',
                style: NumberStyle,
              ),
            ],
          ),
        ],
      );

  Widget _weatherDay(double degree, int time) => Column(
    mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Text(
              degree.round().toString() + '°',
              style: NumberStyle),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all(width: 1, color: Colors.greenAccent),
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
            style: NumberStyle,
          ),
        ],
      );

  Widget _buildWeatherDayGraph() {
    return new ListView.builder(
      itemCount: 8,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,

      itemBuilder: (BuildContext context, int index) {

        return _weatherDay(_dayWeather?.list[index].main.temp.toDouble() ?? 0.0, (_getHour() + index * 3) % 24);
      },);
  }

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
              style: NumberStyle,
            ),
          ),
          Container(
            child: Text(
              degree.round().toString() + '°',
              style: NumberStyle,
            ),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              border: Border.all(width: 1, color: Colors.lightBlueAccent),
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

  int _indexIs(index) {
    if (index == 0) {
      return 0;
    } else {
      return index * 8 - 1;
    }
  }

  Widget _buildWeatherWeekGraph() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return _weatherWeek(weekDays[(_getWeekDay() + index) % 7].toString(), _dayWeather?.list[_indexIs(index)].main.temp.toDouble() ?? 0.0, _indexIs(index));
      },);
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
          style: NumberStyle,
        ),
      ),
    );
  }

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
          return _getData();
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
                                  Text(
                                    'Right Now',
                                    style: TitleStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                  ElevatedButton(
                                      child: Text('Choose location'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Scaffold(
                                                    appBar: AppBar(
                                                      title: const Text(
                                                          'Choose location'),
                                                    ),
                                                    body: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                              child: ListView
                                                                  .builder(
                                                            itemCount:
                                                                cities.length,
                                                            itemBuilder:
                                                                _createListView,
                                                          ))
                                                        ]))));
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
                                  Text(
                                    'This Day',
                                    style: TitleStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    constraints: BoxConstraints.tightForFinite(width: 370, height: 220),
                                    child: _buildWeatherDayGraph(),
                                  ),
                                ]),
                            Column(children: [
                              Container(
                                constraints: BoxConstraints.tightForFinite(
                                    width: 200, height: 60),
                                alignment: Alignment.center,
                                child: Text('This Week',
                                    style: TitleStyle,
                                    textAlign: TextAlign.left),
                              ),
                              Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints.tightForFinite(width: 370, height: 220),
                                child: _buildWeatherWeekGraph(),
                              ),
                            ]),
                          ],
                        ))));
          },
        ),
  ));
  }
}
