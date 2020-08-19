import 'package:flutter/material.dart';

class NoMoreDataMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Text("No more games",
        style: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF999999),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w300));
  }
}
