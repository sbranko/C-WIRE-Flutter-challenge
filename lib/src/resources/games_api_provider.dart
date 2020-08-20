import 'dart:async';
import 'dart:convert';

import 'package:c_wire_app/src/models/game_details.dart';
import 'package:c_wire_app/src/models/games.dart';
import 'package:http/http.dart' show Client;

final basicUrl = 'http://www.giantbomb.com/api/';

final String API_KEY = "13c5a6bbf2157080b5b3382e6d88e0c34d5de409";

final String searchGames = basicUrl +
    'search/?api_key=$API_KEY&format=json&resources=game&page=0&query=fifa&field_list=id,name,image,platforms,description,guid';

class GamesApiProvider {
  Client client = Client();

  Future<Games> getGamesBySearchName(int pageNumber, String gameName) async {
    final String searchGames = basicUrl +
        'search/?api_key=$API_KEY&format=json&resources=game&page=$pageNumber&query=$gameName&field_list=id,name,image,platforms,description,guid';

    final response = await client.get(searchGames);
    var parsedGamesList = json.decode(response.body);

    return Games.fromJson(parsedGamesList);
  }

  Future<GameDetails> getGameDetailsByGuid(String guid) async {
    final String gameDetails = basicUrl +
        'game/$guid/?api_key=$API_KEY&format=json&field_list=guid,id,name,description,image,platforms,genres,images';

    final response = await client.get(gameDetails);
    var parsedGamesList = json.decode(response.body);

    return GameDetails.fromJson(parsedGamesList);
  }
}
