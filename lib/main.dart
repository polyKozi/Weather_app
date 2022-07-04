import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Weather forecast',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //const HomePage({Key? key}) : super(key: key);

  Widget _weatherRightNow(int degree, int feelsLikeDegree) => Row(
        children: [
          Image.asset(
            'assets/images/snow.png',
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
            'assets/images/sun.png',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather forecast'),
      ),
      body: Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text(
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
    );
  }
}

// class LocationPage extends StatelessWidget {
//   const LocationPage({super.key});
//
//   Widget _location(String city) => Container(
//     alignment: Alignment.centerLeft,
//     height: 50,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       border: Border.all(width: 1, color: Colors.grey),
//     ),
//     padding: EdgeInsets.all(5.0),
//     child: Text(city, style: TextStyle(
//         fontSize: 26,
//         fontFamily: 'Times New Roman'),),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Choose location'),
//       ),
//         body: ListView(
//           padding: const EdgeInsets.all(8),
//           children: <Widget>[
//             _location('Omsk'),
//             _location('Tumen'),
//             _location('Kurgan'),
//             _location('Omsk'),
//             _location('Tumen'),
//             _location('Kurgan'),
//             _location('Omsk'),
//             _location('Tumen'),
//             _location('Kurgan'),
//             _location('Omsk'),
//             _location('Tumen'),
//             _location('Kurgan'),
//             _location('Omsk'),
//             _location('Tumen'),
//             _location('Kurgan'),
//             _location('Omsk'),
//             _location('Tumen'),
//             _location('Kurgan'),
//             _location('Omsk'),
//             _location('Tumen'),
//             _location('Kurgan'),
//             _location('Omsk'),
//             _location('Tumen'),
//             _location('Kurgan'),
//           ],
//         )
//     );
//   }
// }

// class LocationPage extends StatefulWidget {
//   @override
//   _LocationPageState createState() => _LocationPageState();
// }
//
// class _LocationPageState extends State<LocationPage> {
//   bool tap = false;
//
//   Widget _createListView(String city) {
//     return GestureDetector(
//         onTap: () {
//           setState(() {
//             tap = !tap;
//           });
//         },
//         child: Container(
//           alignment: Alignment.centerLeft,
//           height: 50,
//           decoration: BoxDecoration(
//             color: tap ? Colors.grey : Colors.white,
//             border: Border.all(width: 1, color: Colors.grey),
//           ),
//           padding: EdgeInsets.all(5.0),
//           child: Text(
//             city,
//             style: TextStyle(fontSize: 26, fontFamily: 'Times New Roman'),
//           ),
//         ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Choose location'),
//         ),
//         body: ListView(
//           padding: const EdgeInsets.all(8),
//           children: <Widget>[
//             _createListView('Omsk'),
//             _createListView('Tumen'),
//             _createListView('Kurgan'),
//           ],
//         ));
//   }
// }

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
        ]));
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
          padding: EdgeInsets.all(5.0),
          child: Text(
            cities[index],
            style: TextStyle(fontSize: 26, fontFamily: 'Times New Roman'),
          ),
      ),
    );
  }
}
