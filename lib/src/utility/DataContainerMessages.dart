import 'dart:ui';

import 'package:flutter/material.dart';

class DataContainerMessages {
  Widget noData() {
    return new Container(
      child: Center(
        child: Text(
          'No data',
          style: _getTextStyle(16.0, FontWeight.w500),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget dataLoading() {
    return Container(
      child: Text(
        'Data is loading ...',
        style: _getTextStyle(16.0, FontWeight.w500),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
    );
  }

  _getTextStyle(double fontSize, FontWeight fontWeight) {
    return TextStyle(
        fontSize: fontSize,
        color: Color(0xFF666666),
        fontFamily: 'Montserrat',
        fontWeight: fontWeight);
  }
}
