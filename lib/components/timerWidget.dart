// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class TimerWidget extends StatefulWidget {
//   final int postId;
//
//   TimerWidget({required this.postId});
//
//   @override
//   _TimerWidgetState createState() => _TimerWidgetState();
// }
//
// class _TimerWidgetState extends State<TimerWidget> {
//   late Timer _timer;
//   int _remainingTime = 0;
//   bool _isTimerActive = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _remainingTime = (5 + (widget.postId % 5)) * 10; // Assigning random time based on postId
//     _startTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   void _startTimer() {
//     _isTimerActive = true;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_remainingTime > 0) {
//         setState(() {
//           _remainingTime--;
//         });
//       } else {
//         _timer.cancel(); // Timer stops when it reaches 0
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(Icons.timer, size: 20),
//         SizedBox(width: 5),
//         Text('$_remainingTime s'),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:visibility_detector/visibility_detector.dart';

class TimerWidget extends StatefulWidget {
  final int postId;

  TimerWidget({required this.postId});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _remainingTime = 0;
  bool _isTimerActive = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = (5 + (widget.postId % 5)) * 10; // Assigning random time based on postId
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (!_isTimerActive) {
      _isTimerActive = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_remainingTime > 0) {
          setState(() {
            _remainingTime--;
          });
        } else {
          _timer.cancel(); // Stop the timer when it reaches 0
          _isTimerActive = false;
        }
      });
    }
  }

  void _pauseTimer() {
    if (_isTimerActive) {
      _timer.cancel();
      _isTimerActive = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('timer-${widget.postId}'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0) {
          _startTimer();
        } else {
          _pauseTimer();
        }
      },
      child: Row(
        children: [
          Icon(Icons.timer, size: 20),
          SizedBox(width: 5),
          Text('$_remainingTime s'),
        ],
      ),
    );
  }
}
