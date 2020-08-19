import 'package:c_wire_app/src/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C-Wire app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFE2E1E1),
        // accentTextTheme: Typography(platform: TargetPlatform.iOS).black,
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Color(0xff666666),
            displayColor: Color(0xff999999),
            fontFamily: 'Montserrat'),
        accentColor: Color(0xff999999),
        textSelectionHandleColor: Color(0xff999999),
        iconTheme: IconThemeData(color: Colors.orange),
        primaryColorDark: Colors.red,
        primaryColorLight: Colors.red,
        secondaryHeaderColor: Colors.orange,
        // This makes the visual density adapt to the platform that you run
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SearchScreen(),
    );
  }
}
