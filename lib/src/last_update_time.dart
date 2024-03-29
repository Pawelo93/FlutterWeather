import 'package:flutter/material.dart';

class LastUpdateTime extends StatelessWidget {
  final DateTime dateTime;

  LastUpdateTime(this.dateTime) : assert(dateTime != null);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Updated: ${TimeOfDay.fromDateTime(dateTime).format(context)}',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w200,
        color: Colors.white,
      ),
    );
  }
}
