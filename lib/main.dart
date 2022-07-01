import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

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
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/meteotrend_sun_and_cloud2.png',
                        height: 100,
                        width: 100,
                      ),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('14C'),
                          Text('feels like 10C'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Text('14C'),
                            color: Colors.blue,
                            margin: const EdgeInsets.all(10.0),
                            alignment: Alignment.topCenter,
                            //padding: EdgeInsets.all(0.20),
                            constraints: BoxConstraints.tightForFinite(
                                width: 40, height: 160),
                          ),
                          Text('10:00'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text('15C'),
                            color: Colors.blue,
                            margin: const EdgeInsets.all(10.0),
                            alignment: Alignment.topCenter,
                            //padding: EdgeInsets.all(0.20),
                            constraints: BoxConstraints.tightForFinite(
                                width: 40, height: 160),
                          ),
                          Text('12:00'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text('15C'),
                            color: Colors.blue,
                            margin: const EdgeInsets.all(10.0),
                            alignment: Alignment.topCenter,
                            //padding: EdgeInsets.all(0.20),
                            constraints: BoxConstraints.tightForFinite(
                                width: 40, height: 160),
                          ),
                          Text('14:00'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text('15C'),
                            color: Colors.blue,
                            margin: const EdgeInsets.all(10.0),
                            alignment: Alignment.topCenter,
                            //padding: EdgeInsets.all(0.20),
                            constraints: BoxConstraints.tightForFinite(
                                width: 40, height: 160),
                          ),
                          Text('16:00'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text('13C'),
                            color: Colors.blue,
                            margin: const EdgeInsets.all(10.0),
                            alignment: Alignment.topCenter,
                            //padding: EdgeInsets.all(0.20),
                            constraints: BoxConstraints.tightForFinite(
                                width: 40, height: 160),
                          ),
                          Text('18:00'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text('12C'),
                            color: Colors.blue,
                            margin: const EdgeInsets.all(10.0),
                            alignment: Alignment.topCenter,
                            //padding: EdgeInsets.all(0.20),
                            constraints: BoxConstraints.tightForFinite(
                                width: 40, height: 160),
                          ),
                          Text('20:00'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/meteotrend_sun_and_cloud2.png',
                                height: 50,
                                width: 50,
                              ),
                              Text('MON'),
                              Container(
                                child: Text('12C'),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(10.0),
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.all(0.20),
                                constraints: BoxConstraints.tightForFinite(
                                    width: 160, height: 40),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/meteotrend_sun_and_cloud2.png',
                                height: 50,
                                width: 50,
                              ),
                              Text('TUE'),
                              Container(
                                child: Text('15C'),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(10.0),
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.all(0.20),
                                constraints: BoxConstraints.tightForFinite(
                                    width: 160, height: 40),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/meteotrend_sun_and_cloud2.png',
                                height: 50,
                                width: 50,
                              ),
                              Text('WEN'),
                              Container(
                                child: Text('16C'),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(10.0),
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.all(0.20),
                                constraints: BoxConstraints.tightForFinite(
                                    width: 160, height: 40),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/meteotrend_sun_and_cloud2.png',
                                height: 50,
                                width: 50,
                              ),
                              Text('THU'),
                              Container(
                                child: Text('17C'),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(10.0),
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.all(0.20),
                                constraints: BoxConstraints.tightForFinite(
                                    width: 160, height: 40),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/meteotrend_sun_and_cloud2.png',
                                height: 50,
                                width: 50,
                              ),
                              Text('FRI'),
                              Container(
                                child: Text('21C'),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(10.0),
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.all(0.20),
                                constraints: BoxConstraints.tightForFinite(
                                    width: 160, height: 40),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/meteotrend_sun_and_cloud2.png',
                                height: 50,
                                width: 50,
                              ),
                              Text('SAT'),
                              Container(
                                child: Text('22C'),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(10.0),
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.all(0.20),
                                constraints: BoxConstraints.tightForFinite(
                                    width: 160, height: 40),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/meteotrend_sun_and_cloud2.png',
                                height: 50,
                                width: 50,
                              ),
                              Text('SUN'),
                              Container(
                                child: Text('22C'),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(10.0),
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.all(0.20),
                                constraints: BoxConstraints.tightForFinite(
                                    width: 160, height: 40),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
