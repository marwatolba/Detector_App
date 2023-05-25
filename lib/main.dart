import 'package:flutter/material.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isNearby = false;

  @override
  void initState() {
    super.initState();
    ProximitySensor.events.listen((event) {
      setState(() {
        _isNearby = (event > 0) ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title:const Text(
            'DETECTOR APP',
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Object is ${_isNearby ? 'Nearby' : 'Far'}',
                style: TextStyle(fontSize: 35.0),
              ),
              SizedBox(height: 25.0),
              Container(
                width: 180.0,
                height: 180.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isNearby ? Colors.green : Colors.red,
                ),
                child: _isNearby
                    ? Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 80.0,
                )
                    : Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 80.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
