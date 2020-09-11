import 'package:flutter/material.dart';

void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
          title: 'Flutter Demo Home Page'
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = 'Press the button to increase the counter', _title = 'GAME';
  void _incrementCounter() {
    switch(_counter){
      case(0):
        _text = "There you go, press it again";
        break;
      case(1):
        _text = "And again.";
        break;
      case(2):
        _text = "Again.";
        break;
      case(3):
        _text = "Again..";
        break;
      case(4):
        _text = "Again...";
        break;
      case(5):
        _text = "Keep pressing...";
        break;
      case(6):
        _text = "";
        break;
      case(16):
        _text = "What getting tired?";
        break;
      case(19):
        _text = "LOL that's sad";
        break;
      case(20):
        _text = "Tell you what,";
        break;
      case(21):
        _text = "I'll give you an incentive.";
        break;
      case(22):
        _text = "If you reach 50 presses you will get a prize.";
        break;
      case(23):
        _text = "Whats the prize?";
        break;
      case(24):
        _text = "A link to a \$50 game coupon";
        break;
      case(25):
        _text = "Happy? now keep pressing.";
        break;
      case(26):
        _text = "";
        break;
      case(50):
        _text = "You know what,";
        break;
      case(51):
        _text = "I changed my mind";
        break;
      case(52):
        _text = "Reach a 100 presses";
        break;
      case(53):
        _text = "Unfair you say?";
        break;
      case(54):
        _text = "Well I make the rules kid";
        break;
      case(55):
        _text = "Now get going!";
        break;
      case(56):
        _text = "";
        break;
      case(75):
        _text = "Come on your half way there!";
        break;
      case(80):
        _text = "";
        break;
      case(95):
        _text = "Almost there 5 more come on !!";
        break;
      case(96):
        _text = "4";
        break;
      case(97):
        _text = "3";
        break;
      case(98):
        _text = "2";
        break;
      case(99):
        _text = "1";
        break;
      case(100):
        _text = "You made it!!";
        break;
      case(101):
        _text = "Phew that was exhausting wasn't it?";
        break;
      case(102):
        _text = "Go grab a drink and come back.";
        break;
      case(103):
        _text = ".";
        break;
      case(104):
        _text = "..";
        break;
      case(105):
        _text = "...";
        break;
      case(106):
        _text = "Your back?? Already?";
        break;
      case(107):
        _text = "Your prize?";
        break;
      case(108):
        _text = "Well to be honest I did not expect you to make it this far...";
        break;
      case(109):
        _text = "I need to look for the link hold on.";
        break;
      case(110):
        _text = "Press the button or what ever till I find it.";
        break;
      case(111):
        _text = "";
        break;
      case(120):
        _text = "Aahah!";
        break;
      case(122):
        _text = "I found it!";
        break;
      case(123):
        _text = "TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! ";
        _title = "TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! TROLLED! ";
        break;
      case(124):
        _text = "Wasting your time pressing a goddamn button";
        _title = "GAME";
        break;
      case(125):
        _text = "Go get a life!!";
        break;
      case(126):
        _text = "";
        break;
      case(130):
        _text = "Hmm your still here?";
        break;
      case(131):
        _text = "Look I know you have nothing to do";
        break;
      case(132):
        _text = "But that doesn't mean you have to keep pushing the button";
        break;
      case(133):
        _text = "";
        break;
      case(135):
        _text = ".";
        break;
      case(143):
        _text = "..";
        break;
      case(150):
        _text = "...";
        break;
      case(160):
        _text = "God you're one persistent son of a bitch I'll give you that";
        break;
      case(162):
        _text = "";
        break;
      case(168):
        _text = "You're wasting your time...";
        break;
      case(170):
        _text = "";
        break;
      case(190):
        _text = "FOR FUCKS SAKE PLEASE LEAVE!!";
        break;
      case(194):
        _text = "WHAT DO YOU FUCKING WANT!!";
        break;
      case(195):
        _text = "The link?";
        break;
      case(196):
        _text = "Ha";
        break;
      case(197):
        _text = "Haha";
        break;
      case(198):
        _text = "Hahahahaha";
        break;
      case(199):
        _text = "God";
        break;
      case(200):
        _text = "You're really stupid aren't you?";
        break;
      case(201):
        _text = "Any normal person would have figured this out by now...";
        break;
      case(202):
        _text = "THE PRIZE WAS A LIE!!!";
        break;
      case(203):
        _text = "Now GET THE FUCK OUT OF MY HOME !! ";
        break;
      case(205):
        _text = "";
        break;
      default:
        break;
    }
    setState(() {
      _counter++;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(_title),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              _text,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add_to_photos),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
