import 'package:flutter_ble_write_test/ble_gps_write_test_page.dart';
import 'package:flutter_ble_write_test/bluetooth_connect_page.dart';
// import 'package:flutter_ble_write_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_write_test/welcome_page.dart';
import 'package:flutter_blue/flutter_blue.dart';

class RouteGenerator{
  static Route<dynamic> generalRoute(RouteSettings settings){

    final dynamic args = settings.arguments;

    print('\n Args: ${settings.arguments} \n ');

    switch(settings.name) {
      case '/':
        if (args is String) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return WelcomePage(
                //connected: true,
                device: args,
              );
            },
          );
        }
        else {
          return _errorRoute();
        }
        break;

      case '/ble_connect':
        if(args is FlutterBlue){
          return MaterialPageRoute(
            builder: (_) => BluetoothConnectPage(flutterBlue: args,)
          );
        }
        else{
          return _errorRoute();
        }
        break;

      case '/gps_data_send':
        if(args is BluetoothDevice){
          return MaterialPageRoute(
            builder: (BuildContext context){
              return PositionWriteWidget(
                device: args,
              );
            }
          );
        }
        break;
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text(
              'ERROR',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        );
      }
    );
  }
}