import 'package:c_wire_app/src/screens/search_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _SearchScreenState createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Enter game name",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                onSubmitted: (String value) async {
                  // start the SearchResults and wait for it to finish with a result
                  await Navigator.pushNamed(context, SearchResults.routeName,
                      arguments: _controller.text.toString());
                },
              ),
            )
          ])),
    );
  }
}
