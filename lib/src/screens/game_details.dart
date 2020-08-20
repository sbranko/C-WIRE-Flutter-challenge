import 'package:c_wire_app/src/models/game_details.dart' as gameDetailsResults;
import 'package:c_wire_app/src/models/games.dart' as gameResult;
import 'package:c_wire_app/src/resources/games_api_provider.dart';
import 'package:c_wire_app/src/shared/LoadingBar.dart';
import 'package:c_wire_app/src/utility/DataContainerMessages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as images;
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class GameDetails extends StatefulWidget {
  gameResult.Results results;

  GameDetails(this.results);

  @override
  State<StatefulWidget> createState() {
    return new _GameDetailsState(this.results);
  }
}

class _GameDetailsState extends State<GameDetails> {
  gameResult.Results game;
  gameDetailsResults.Results gameDetails;
  List<String> imageUrlList = [];
  List<Widget> imageSliders;
  List<gameDetailsResults.Genres> genres = [];
  List<gameDetailsResults.Platforms> platforms = [];

  FToast fToast;

  bool loadingPage = true;

  var gamesApiService = new GamesApiProvider();

  DataContainerMessages dataMessage = new DataContainerMessages();

  _GameDetailsState(gameResult.Results results) {
    if (results != null) {
      this.game = results;
    }
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);

    getGameDetails(widget.results.guid.toString());
  }

  Widget createGameDetails() {
    if (gameDetails == null && loadingPage) {
      dataMessage.dataLoading();
    } else if (gameDetails == null && !loadingPage) {
      return dataMessage.noData();
    }
    return new SingleChildScrollView(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          new Stack(
            children: <Widget>[
              new Positioned(
                child: new Align(
                  alignment: FractionalOffset.topCenter,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: imageSliders != null ? imageSliders : [],
                  ),
                ),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: IntrinsicHeight(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16.0, bottom: 8.0, top: 40),
                          child: Text(
                            gameDetails != null ? gameDetails.name : '',
                            style: _getTextStyle(24.0, FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16.0, bottom: 8.0, top: 16),
                          child: gameDetails != null
                              ? Html(
                                  data: gameDetails.description,
                                  onLinkTap: (url) {
                                    print("Opening $url...");
                                  },
                                  onImageTap: (src) {
                                    print(src);
                                  },
                                  onImageError: (exception, stackTrace) {
                                    print(exception);
                                  },
                                )
                              : Text(
                                  'No description',
                                  style: _getTextStyle(16.0, FontWeight.w300),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                ),
                        ),
                      ]),
                ),
              )
            ]),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8),
                        child: Text(
                          'Platforms',
                          style: _getTextStyle(20.0, FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: platforms.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 16.0, bottom: 4),
                            child: Text(
                              '${platforms[index].name}',
                              style: _getTextStyle(16.0, FontWeight.w300),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                          );
                        },
                      ),
                    ]),
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8),
                        child: Text(
                          'Genres',
                          style: _getTextStyle(20.0, FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: genres.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 16.0, bottom: 4),
                            child: Text(
                              '${genres[index].name}',
                              style: _getTextStyle(16.0, FontWeight.w300),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                          );
                        },
                      ),
                    ]),
              ),
            ]),
          ),
        ]));
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
          Expanded(
            child: Text(message,
                style: _getTextStyle(12.0, FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
          )
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  _getTextStyle(double fontSize, FontWeight fontWeight) {
    return TextStyle(
        fontSize: fontSize,
        color: Color(0xFF666666),
        fontFamily: 'Montserrat',
        fontWeight: fontWeight);
  }

  getImageUrlList() {
    if (gameDetails.images != null) {
      gameDetails.images.forEach((item) {
        imageUrlList.add(item.screenUrl.toString());
      });
    }
  }

  getPlatformList() {
    if (gameDetails.platforms != null) {
      gameDetails.platforms.forEach((element) {
        platforms.add(element);
      });
    }
  }

  getGenresList() {
    if (gameDetails.genres != null) {
      gameDetails.genres.forEach((item) {
        genres.add(item);
      });
    }
  }

  List<Widget> getImageSliders() {
    imageSliders = imageUrlList != null
        ? imageUrlList
            .map((item) => Container(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            images.Image.network(item.toString(),
                                fit: BoxFit.cover, width: 1000.0),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  'No. ${imageUrlList.indexOf(item)} image',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ))
            .toList()
        : [];
  }

  Future getGameDetails(String guid) async {
    var result = await gamesApiService.getGameDetailsByGuid(guid);

    if (result.statusCode == 1) {
      if (!mounted) return;

      setState(() {
        gameDetails = result.results;

        if (gameDetails != null) {
          getImageUrlList();
          getPlatformList();
          getGenresList();
        }

        getImageSliders();

        loadingPage = false;
      });
    } else {
      loadingPage = false;
      _showToast('Error message ' + result.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(gameDetails != null ? gameDetails.name : '')),
      body: Center(
        child: ModalProgressHUD(
          child: createGameDetails(),
          color: Colors.white,
          inAsyncCall: loadingPage,
          progressIndicator: LoadingBar(),
        ),
      ),
    );
  }
}
