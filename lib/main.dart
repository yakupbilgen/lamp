import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lamp/lamp.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: HandLamp(),
  ));
}

class HandLamp extends StatefulWidget {
  @override
  _HandLampState createState() => _HandLampState();
}

class _HandLampState extends State<HandLamp> {
  bool _hasLamp = false;
  bool _lampTurn = false;
  double _lampIntensity = 1.0;
  String btnText, lampText;

  @override
  void initState() async {
    super.initState();
    _hasLamp = await Lamp.hasLamp;
    _hasLamp = _hasLamp;
    setState(() {});
  }

  Future lampTurn() async {
    if (_lampTurn) {
      Lamp.turnOff();
      btnText = "Turn On";
      lampText = "lampoff";
    } else {
      Lamp.turnOn(intensity: _lampIntensity);
      btnText = "Turn Off";
      lampText = "lampon";
    }

    _lampTurn = !_lampTurn;
    setState(() {});
    debugPrint("success");
  }

  changeIntensity(double _intensity) {
    Lamp.turnOn(intensity: _intensity);
    setState(() {
      _lampIntensity = _intensity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lamp"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/$lampText.png"),
            Padding(padding: EdgeInsets.only(top: 100)),
            SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton(
                child: Text(
                  "$btnText",
                  style: TextStyle(fontSize: 50),
                ),
                onPressed: lampTurn,
              ),
            ),
            Slider(
              value: _lampIntensity,
              onChanged: _lampTurn ? changeIntensity : null,
            ),
          ],
        ),
      ),
    );
  }
}
