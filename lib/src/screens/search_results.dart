import 'package:c_wire_app/src/models/games.dart';
import 'package:c_wire_app/src/resources/games_api_provider.dart';
import 'package:c_wire_app/src/shared/LoadingBar.dart';
import 'package:c_wire_app/src/shared/RefresherFooter.dart';
import 'package:c_wire_app/src/shared/RefresherHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ok_image/ok_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  FToast fToast;

  Games games = new Games();

  var gamesApiService = new GamesApiProvider();

  RefreshController _refreshController;
  ScrollController _scrollController;

  int currentPage = 0;
  bool loadingPage = true;

  @override
  Future<void> initState() {
    super.initState();
    fToast = FToast(context);

    _refreshController = RefreshController();
    _scrollController = ScrollController();

    if (widget.emailController != null) {
      getGames(0, widget.emailController.text.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.emailController.text.toString()),
      ),
      body: Center(
        child: ModalProgressHUD(
          child: gamesWidget(),
          color: Colors.white,
          inAsyncCall: loadingPage,
          progressIndicator: LoadingBar(),
        ),
      ),
    );
  }

  //
  Widget buildText(String item) {
    final text = item
        .replaceAll('&#x27;', "'")
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '')
        .replaceAll('<span>', '')
        .replaceAll('</span>', '')
        .replaceAll('<ul>', '')
        .replaceAll('</ul>', '')
        .replaceAll('<li>', '')
        .replaceAll('</li>', '')
        .replaceAll('<br>', '')
        .replaceAll('<br/>', '')
        .replaceAll('<b>', '')
        .replaceAll('</b>', '')
        .replaceAll('<strong>', '')
        .replaceAll('</strong>', '')
        .replaceAll('<h2>', '')
        .replaceAll('</h2>', '');

    return Text(
      text,
      style: _getTextStyle(14.0, FontWeight.w300),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      textAlign: TextAlign.start,
    );
  }

  _getTextStyle(double fontSize, FontWeight fontWeight) {
    return TextStyle(
        fontSize: fontSize,
        color: Color(0xFF666666),
        fontFamily: 'Montserrat',
        fontWeight: fontWeight);
  }

  Future getGames(int pageNumber, String gameName) async {
    var result =
        await gamesApiService.getGamesBySearchName(pageNumber, gameName);

    if (result.statusCode == 1) {
      if (!mounted) return;

      setState(() {
        if (games != null && games.results != null) {
          games.results.addAll(result.results);
        } else {
          games = result;
        }

        loadingPage = false;
        currentPage = pageNumber;
      });
    } else {
      loadingPage = false;
      _showToast('Error message ' + result.statusCode.toString());
    }
  }

  _showToast(String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  String _getPlatforms(List<Platforms> platforms) {
    var platformNames = new List<String>();
    platforms.forEach((item) {
      platformNames.add(item.name);
    });

    var concatenate = StringBuffer();

    platformNames.forEach((item) {
      concatenate.write(item + ', ');
    });

    return concatenate.toString();
  }

  void _onLoading() async {
    await getGames(currentPage + 1, widget.emailController.text.toString());
    _refreshController.loadComplete();
  }

  Widget imageWidget(String imageUrl) {
    return new OKImage(
      url: imageUrl,
      width: 100,
      height: 100,
      timeout: Duration(seconds: 20),
    );
  }

  Widget gamesWidget() {
    if (games.results == null) {
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
    return Scrollbar(
      child: SmartRefresher(
          primary: false,
          controller: _refreshController,
          scrollController: _scrollController,
          header: RefresherHeader(),
          footer: RefresherFooter(),
          enablePullUp: true,
          enablePullDown: false,
          onRefresh: () async {
            await getGames(0, widget.emailController.text.toString());
            _refreshController.refreshCompleted();
          },
          onLoading: _onLoading,
          child: games.results.length == 0
              ? new Container(
                  child: Center(
                    child: Text(
                      'No data',
                      style: _getTextStyle(16.0, FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: games.results.length,
                  itemExtent: 124,
                  itemBuilder: (context, index) {
                    Results gameResults = games.results[index];
                    return Card(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    imageWidget(gameResults.image.thumbUrl),
                                  ]),
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.0, bottom: 8.0),
                                    child: Text(
                                      gameResults.name,
                                      style:
                                          _getTextStyle(16.0, FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  gameResults.description != null
                                      ? new Container(
                                          width: 240,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 16.0, bottom: 8.0),
                                                  child: buildText(
                                                      gameResults.description)),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 16.0),
                                                child: Text(
                                                  gameResults.platforms != null
                                                      ? _getPlatforms(
                                                          gameResults.platforms)
                                                      : '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: _getTextStyle(
                                                      14.0, FontWeight.w200),
                                                  maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Text(''),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
