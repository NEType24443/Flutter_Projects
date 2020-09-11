import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ble_write_test/welcome_page.dart';
import 'dart:async';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_ble_write_test/info_widget.dart';


class PositionWriteWidget extends StatefulWidget {
  PositionWriteWidget({
    Key key,
    @required
    this.device
  }) : super(key: key);

  final BluetoothDevice device;
  final Map<Guid, List<int>> readValues = new Map<Guid, List<int>>();

  @override
  _PositionWriteWidgetState createState() => _PositionWriteWidgetState();
}

class _PositionWriteWidgetState extends State<PositionWriteWidget> {

  StreamSubscription<Position> _positionStreamSubscription;
  Position _position;
  List<BluetoothService> _services;
  BluetoothCharacteristic _latCharacteristic, _lonCharacteristic;

  @override
  void initState(){ // Start of page
    super.initState();
    _getServices(); // Separate because async cannot be used for initState
  }

  void _getServices() async{  // Discover all services
    try {
      await widget.device.connect();
    }
    catch (e) {
      if (e.code != 'already_connected') {
        throw e;
      }
    }
    finally {
      _services = await widget.device.discoverServices();
    }
    if(_findLatLonService()){
      // Can start writing now
      print("Can start writing now");
    }
    else{
      widget.device.disconnect();
      Navigator.pushReplacementNamed(context, "/", arguments: '');
    }
  }

  bool _findLatLonService(){
    bool foundLat = false, foundLon = false;
    for (BluetoothService service in _services) {
      print("Service UUID: ${service.uuid}\n |");     // 00001819-0000-1000-8000-00805f9b34f1
      // List<BluetoothCharacteristic> characteristics = new List<BluetoothCharacteristic>();
      for(BluetoothCharacteristic characteristic in service.characteristics){
        print(" |-> Characteristic UUID: ${characteristic.uuid}");
        if(characteristic.uuid.toString() == "00002aae-0000-1000-8000-00805f9b34fb"){
          print(" ^--- GOT LATITUDE CHAR ");
          _latCharacteristic = characteristic;
          foundLat = true;
        }
        if(characteristic.uuid.toString() == "00002aaf-0000-1000-8000-00805f9b34fb"){
          print(" ^--- GOT LONGITUDE CHAR ");
          _lonCharacteristic = characteristic;
          foundLon = true;
        }
      }
    }
    return (foundLon && foundLat);
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocationPermission>(
      future: checkPermission(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data == LocationPermission.denied) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const InfoWidget(
                'Request location permission',
                'Access to the device\'s location has been denied, please '
                'request permissions before continuing'
              ),
              RaisedButton(
                child: const Text('Request permission'),
                onPressed: () => requestPermission()//.then((status) {
                  // setState(_positions.clear);
                // }),
              ),
            ],
          );
        }
        if (snapshot.data == LocationPermission.deniedForever) {
          return const InfoWidget(
            'Access to location permanently denied',
            'Allow access to the location services for this App using the '
            'device settings.'
          );
        }
        if(widget.device == null){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const InfoWidget(
                  'Not connected to any device',
                  'Please connect to a device before continuing'
              ),
              RaisedButton(
                child: const Text('Click here to go back'),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:(BuildContext context){
                      return new WelcomePage(device: '');
                    }
                  ),
                )
              ),
            ],
          );
        }
        else{
          return _buildSendingView();
        }
      }
    );
  }

  Widget _buildSendingView(){
    return(
      Scaffold(
        appBar: AppBar(
          title: Text('Listening and Writing'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _startedWriting(),
              RaisedButton(
                child: _buildButtonText(),
                color: _determineButtonColor(),
                onPressed: () {
                  _toggleListening();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder:(BuildContext context){
                return new WelcomePage(
                  device: '',
                );
              }
            ));
          }
        ),
      )
    );
  }

  Widget _startedWriting(){
    if(_isListening()){// && !(_position.latitude == null) && !(_position.longitude == null)){
      return Column(
        children: [
          Text(
            'Latitude: ',//${_position.latitude}, Longitude: ${_position.longitude}',
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          Text(
            'Timestamp:',// ${_position.timestamp.toString()}',
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          SizedBox(
            height: 2.0,
          ),
        ],
      );
    }
    else{
      return Column(
        children:[
          Text(
            'Toggle Listening and Writing'
          ),
          SizedBox(
            height: 2.0,
          ),
        ]
      );
    }
  }

  bool _isListening() => !(_positionStreamSubscription == null ||
      _positionStreamSubscription.isPaused);

  Widget _buildButtonText() {
    return Text(_isListening() ? 'Stop listening' : 'Start listening');
  }

  Color _determineButtonColor() {
    return _isListening() ? Colors.red : Colors.green;
  }

  void _toggleListening() {
    if (_positionStreamSubscription == null) {
      final positionStream = getPositionStream();
      _positionStreamSubscription = positionStream.handleError((error) {
        _positionStreamSubscription.cancel();
        _positionStreamSubscription = null;
      }).listen((position) => setState(() {
        _position = position;
        print("\nGot Position --> Latitude: ${_position.longitude}, Longitude: ${_position.latitude}");
        _updateLatLonCharacteristic();
      }));
      _positionStreamSubscription.pause();
    }

    setState(() {
      if (_positionStreamSubscription.isPaused) {
        _positionStreamSubscription.resume();
        print("Position Stream Resumed");
      } else {
        _positionStreamSubscription.pause();
        print("Position Stream Paused");
      }
    });
  }

  void _updateLatLonCharacteristic() async {
    await _latCharacteristic.write(utf8.encode( _position.latitude.toString()));
    await _lonCharacteristic.write(utf8.encode(_position.longitude.toString()));
  }

  @override
  void dispose() {
    super.dispose();
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }
  }
}