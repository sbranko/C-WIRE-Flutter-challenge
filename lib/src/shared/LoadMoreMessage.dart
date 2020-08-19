import 'package:flutter/material.dart';

class LoadMoreMessage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return 
      new Text(
        "Release to load more", 
        style: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF999999),
          fontFamily: 'Montserat',
          fontWeight: FontWeight.w300
        )
      );
  }
}