import 'dart:isolate';
import 'dart:math';

import 'package:flutter/material.dart';

class IsolateController extends ChangeNotifier {

  Isolate? newIsolate;

  double _currentValue = 0;

  double get currentValue => _currentValue;

  ReceivePort _receivePort = ReceivePort();

  late SendPort _sendPortByIslate;

  bool _isPaused = false;
  bool _isCreated = false;

  bool get isPaused => _isPaused;
  bool get isCreated => _isCreated;

  Capability? capability;

  set currentValue(double d) {
    _currentValue = d;
    notifyListeners();
  }

  Future<void> createIsolate() async {
    newIsolate = await Isolate.spawn(multiplyNumber, _receivePort.sendPort);
  }

  void listen() {
    _receivePort.listen((dynamic message) {
      print("message listen " + message.runtimeType.toString());
      if (message is SendPort) {
        _sendPortByIslate = message;
        _sendPortByIslate.send(_currentValue);
      } else if (message is double) {
        currentValue = message;
        print("number is " + message.toString());
      }
    });
  }

  Future<void> start() async {
    if (_isPaused) {
      return Future.value(null);
    }
    listen();
    await createIsolate();
    _isCreated = true;
    _isPaused = false;
    notifyListeners();
    print("Started..");
  }

  void pause() {

    if (_isPaused) {
      newIsolate?.resume(capability!);
    } else {
      capability = newIsolate?.pause();
    }

    _isCreated = !_isCreated;
    _isPaused = !_isPaused;
    notifyListeners();
    print("Paused.");
  }

  void terminate() {
    try {
      newIsolate?.kill();
      _isPaused = false;
      _isCreated = false;
      notifyListeners();
      print("Terminated.");
    } catch(e) {
      print(e);
    }
  }

}

Future<void> multiplyNumber(SendPort callerSP) async {
  try {
    double multiplyValue = 2;

    ReceivePort _receivePort = ReceivePort();
    callerSP.send(_receivePort.sendPort);

    _receivePort.listen((dynamic message) {
      if (message is double) {
        multiplyValue = message;
      }
    });

    double sum = 1;
    for (int x = 0; x < 10000; x++) {
      sum += await getRandom();
    }

    callerSP.send(sum.toDouble());
  } catch(e) {
    print(e);
  }
}

Future<double> getRandom() {

  Random r = Random();

  return Future((){
    double sum = 0;
    for(int x = 0; x < 100; x++) {
      sum += r.nextInt(100).toDouble();
    }
    return sum;
  });
}
