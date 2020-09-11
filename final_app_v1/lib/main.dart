import 'package:flutter/material.dart';
import 'package:final_app_v1/welcome_page.dart';
import 'package:final_app_v1/route_generator.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLE_GPS_WRITE',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: WelcomePage(device: '',),
      onGenerateRoute: RouteGenerator.generalRoute,
//    routes: {
//      WelcomePage.id: (context) => WelcomePage(),
//      BluetoothConnectPage.id: (context) => BluetoothConnectPage(),
//    },
//      initialRoute: WelcomePage.id,
    );
  }
}