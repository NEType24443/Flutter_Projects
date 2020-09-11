import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {

  String location;  // location name for the UI
  String time;  //  time at that location
  String flag;  //  URL to an asset flag icon
  String url; //  location url for api endpoint
  bool isDaytime;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async{
    try{
      Response response = await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from JSON data
      String  dateTime = data['datetime'],
          offset = data['utc_offset'],
          hours = offset.substring(1,3),
          minutes = offset.substring(4,6);

      //print(dateTime);
      //print(offset);

      //  create DateTime object
      DateTime now = DateTime.parse(dateTime);

      bool sign = offset.startsWith('+'); // sign is true of '+'
      now = (sign) ? now.add(Duration(hours: int.parse(hours) , minutes: int.parse(minutes))) : now.subtract(Duration(hours: int.parse(hours) , minutes: int.parse(minutes)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
      print(time);
    }
    catch(e){
      print('Caught Error: $e');
      time = 'Could not get time data';
    }
  }
}

