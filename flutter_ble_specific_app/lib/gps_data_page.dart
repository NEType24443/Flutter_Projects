import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

const kApiKey =
    'pk.eyJ1IjoibmV0eXBlIiwiYSI6ImNrZHN3OGlocTE2d2gyeG1zOTVscHVjMXgifQ.Q0Y3Xi3npbUixFQ-aIVOYA';

class GPSDataPage extends StatelessWidget {
  @override

  GPSDataPage({
    Key key,
  }): super(key: key);

  Widget build(BuildContext context) {
    return MapBoxExample();
  }
}

class MapBoxExample extends StatefulWidget {
  @override
  _MapBoxExampleState createState() => _MapBoxExampleState();
}

class _MapBoxExampleState extends State<MapBoxExample> {
  String _platformVersion = 'Unknown';
  final _origin = WayPoint(
      name: "Home", latitude: 13.2893833, longitude: 74.75696666666667);
  final _destination = WayPoint(
      name: "TMA Pai Hospital", latitude: 13.332534035514994, longitude: 74.74713703893407);

  MapboxNavigation _directions;
  bool _arrived = false;
  double _distanceRemaining, _durationRemaining;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _directions = MapboxNavigation(onRouteProgress: (arrived) async {
      _distanceRemaining = await _directions.distanceRemaining;
      _durationRemaining = await _directions.durationRemaining;

      setState(() {
        _arrived = arrived;
      });
      if (arrived) {
        await Future.delayed(Duration(seconds: 3));
        await _directions.finishNavigation();
      }
    });

    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await _directions.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text('Running on: $_platformVersion\n'),
            SizedBox(
              height: 6,
            ),
            RaisedButton(
              child: Text("Start Navigation"),
              onPressed: () async {
                await _directions.startNavigation(
                    origin: _origin,
                    destination: _destination,
                    mode: MapBoxNavigationMode.drivingWithTraffic,
                    simulateRoute: true,
                    language: "en",
                    units: VoiceUnits.metric);
                print("navigation finished");
              },
            ),
            SizedBox(
              height: 6,
            ),
            RaisedButton(
              child: Text(
                  'Origin'
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(hint: 'Origin',), //'Origin'
                  ),
                );
              },
            ),
            SizedBox(
              height: 6,
            ),
            RaisedButton(
              child: Text(
                  'Destination'
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(hint: 'Destination',), //'Destination'
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Distance Remaining: "),
                      Text(_distanceRemaining != null
                          ? "${(_distanceRemaining * 0.000621371).toStringAsFixed(1)} miles"
                          : "---")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Duration Remaining: "),
                      Text(_durationRemaining != null
                          ? "${(_durationRemaining / 60).toStringAsFixed(0)} minutes"
                          : "---")
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {

  final String hint;

  SearchPage({
    Key key,
    @required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            MapBoxPlaceSearchWidget(
              popOnSelect: true,
              apiKey: kApiKey,
              searchHint: hint,
              limit: 10,
              onSelected: (place) {
                print(place.toRawJson());
                print(place.placeName);
                print(place.center);//74.74611,13.33222, 74.671063,13.076186,74.986594,13.572014
                print(place.geometry.type);
                print(place.geometry.coordinates);
                String address = '';
                place.context.forEach((element) {
                  address += element.toString();
                });
                print(address);
                //print('${place.context[0].text}, ${place.context[1].text}, ${place.context[2].text}');
              },
              context: context,
            ),
            IconButton(
                icon: Icon(Icons.gps_fixed),
                onPressed: (){

                }
            ),
          ],
        ),
      ),
    );
  }
}