import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London',     location: 'London',   flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin',     location: 'Athens',   flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo',      location: 'Cairo',    flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi',    location: 'Nairobi',  flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago',   location: 'Chicago',  flag: 'usa.png'),
    WorldTime(url: 'America/New_York',  location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul',        location: 'Seoul',    flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta',      location: 'Jakarta',  flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata',      location: 'Kolkata',  flag: 'india.png',),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    print(instance);
    // navigate to home screen
    Navigator.pop(context, {
      'location' : instance.location,
      'flagUrl' : instance.flag,
      'url' : instance.url,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('buildState function ran');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              color: Colors.grey[800],
              elevation: 0.0,
              child: ListTile(
                onTap: () {
                  print(locations[index].location);
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/${locations[index].flag}',),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
