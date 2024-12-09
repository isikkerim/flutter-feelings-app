import 'dart:async';

import 'package:flutter/material.dart';



class BreathingExercisePage extends StatefulWidget {
  @override
  _BreathingExercisePageState createState() => _BreathingExercisePageState();
}

class _BreathingExercisePageState extends State<BreathingExercisePage> {
  int _step = 0;
  late int _remainingSeconds;
  late List<int> _durations;
  late String _instructionText;
  late bool _isRunning;
  Timer? _timer; // null olarak başlatılan opsiyonel bir Timer

  @override
  void initState() {
    super.initState();
    _durations = [4, 7, 8]; // Her adımın süresi
    _isRunning = false;
    _setStep(0);
  }

  void _setStep(int step) {
    setState(() {
      _step = step;
      _remainingSeconds = _durations[step];
      _instructionText = _getInstructionText(step);
    });
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });

    _timer?.cancel(); // Var olan timer'ı iptal et
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
          _nextStep();
        }
      });
    });
  }

  void _nextStep() {
    if (_step < _durations.length - 1) {
      _setStep(_step + 1);
    } else {
      _setStep(0); // Tüm adımlar tamamlanınca başa dön
      setState(() {
        _isRunning = false; // Timer döngüsü tamamlandığında durdur
      });
    }
    if (_isRunning) {
      _startTimer(); // Bir sonraki adıma geç ve timer'ı yeniden başlat
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Timer'ı temizle
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4-7-8 Nefes Egzersizi'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _instructionText,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                '$_remainingSeconds',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isRunning ? null : _startTimer,
                child: Text(_isRunning ? 'Devam Ediyor' : 'Başla'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getInstructionText(int step) {
    switch (step) {
      case 0:
        return '4 saniye boyunca burnundan derin bir nefes alın.';
      case 1:
        return 'Nefesi 7 saniye boyunca tutun.';
      case 2:
        return '8 saniye boyunca ağızdan yavaşça nefes verin.';
      default:
        return 'Başlamak için butona basın.';
    }
  }
}

