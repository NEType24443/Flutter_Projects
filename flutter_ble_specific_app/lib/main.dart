import 'package:flutter/material.dart';
import 'package:flutter_ble_specific_app/route_generator.dart';
import 'package:flutter_ble_specific_app/welcome_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLE Demo',
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