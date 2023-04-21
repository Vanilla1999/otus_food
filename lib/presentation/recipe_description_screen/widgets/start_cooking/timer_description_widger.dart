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
  int timeTimer = 0;
  Timer? _timer;
  void _startTimer() {
    _timer= Timer.periodic(
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
    timeTimer = widget.time * 60;
    _startTimer();
  }

  String formatedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatedTime(timeInSecond: timeTimer),
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
