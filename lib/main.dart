
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
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

  List<double> _accelerometerValues;

  @override
  Widget build(BuildContext context) {
    final List<String> accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final double accelerometer2 = _accelerometerValues.last;
    double opacity = procesador(accelerometer2);
        
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica de sensores'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child:  Opacity(opacity: opacity,
            child: Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.headline4.fontSize * 1.1 + 200.0
              ),
              padding: const EdgeInsets.all(8.0),
              color: Colors.red,
              alignment: Alignment.center,
              child: Text('$accelerometer',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white)),
            )),
          ),
          Padding(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$accelerometer'),
              ],
            ),
            padding: const EdgeInsets.all(19.0),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x];
      });
    });
  }

  double procesador(double numero) {
    if(numero.isNegative){
      return numero/-10;
    }else{
      return numero/10;
    }
  }

}