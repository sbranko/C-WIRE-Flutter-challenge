import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: CircularProgressIndicator(
        strokeWidth: 6,
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFF7941D))
      ),
    );
  }
}