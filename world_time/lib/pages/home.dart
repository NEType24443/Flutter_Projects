import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  bool isDaytime;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    isDaytime = data['isDaytime'];
    String bgImage = isDaytime ? 'day.png' : 'night.png';

//  Color bgColor = data['isDaytime'] ?  :  ;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/$bgImage'),
              fit: BoxFit.fitWidth,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 140.0,),
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'flag' : result['flag'],
                        'isDaytime' : result['isDaytime'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[200],
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                  ),
                  color: Colors.grey[800],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.grey[isDaytime? 600 : 800],
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.grey[ isDaytime ? 100 : 800],
                    fontSize: 66.0,
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
