import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Location extends StatelessWidget {
  final String location;

  Location(this.location) : assert(location != null);

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
