import 'dart:async';

import 'package:flutter/material.dart';

class TimerDisctiption extends StatelessWidget {
  final int time;

  const TimerDisctiption({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      color: Color(0xff2ECC71),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Таймер",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
          Expanded(
              child: _Timer(
            time: time,
          )),
        ],
      ),
    );
  }
}

class _Timer extends StatefulWidget {
  final int time;

  const _Timer({Key? key, required this.time}) : super(key: key);

  @override
  State<_Timer> createState() => _TimerState();
}

class _TimerState extends State<_Timer> {
  void _startTimer() {
    int timeTimer = widget.time;
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (timeTimer == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            timeTimer--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    //_startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return const Text(
      "38:59",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white),
    );
  }
}
