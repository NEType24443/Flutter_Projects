import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ble_/bluetooth_connect_page.dart';
import 'package:flutter_blue/flutter_blue.dart';


class WelcomePage extends StatelessWidget {

  final String device;

  final FlutterBlue flutterBlue = FlutterBlue.instance;

  WelcomePage({
    Key key,
    @required this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print('\n Device: $device \n');
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                //color: Colors.grey[300],
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,//.fromRGBO(1000, 900, 10, 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),

                ),
                child: Text(
                  (device == '') ? 'Not Connected' :'Connected to: $device',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[100],
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.3,
              ),
              FlatButton(
                color: Colors.deepPurpleAccent,
                child: Text(
                  'Scan for Device',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  print('\nOpening BluetoothConnectPage\n');
                  Navigator.pushReplacementNamed(context, '/ble_connect', arguments: flutterBlue);
                }
              ),
             // SizedBox(
             //   height: height * 0.01,
             // ),
             // FlatButton(
             //   color: Colors.grey[300],
             //   child: Text('Connect to device:'),
             //   onPressed: () {
             //      print('\nOpening GPS Write Page\n');
             //      Navigator.pushReplacementNamed(context, '/gps_data_send', arguments: flutterBlue);
             //   },
             // ),
              SizedBox(
                height: height * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
