import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  var emailController = new TextEditingController();

  SearchResults(this.emailController);

  @override
  _SearchResultsState createState() {
    return _SearchResultsState();
  }
}

class _SearchResultsState extends State<SearchResults> {
  // this allows us to access the TextField text
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.emailController.text.toString())),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
