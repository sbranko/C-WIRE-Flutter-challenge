import 'package:c_wire_app/src/models/genres.dart';
import 'package:c_wire_app/src/models/image.dart';
import 'package:c_wire_app/src/models/images.dart';
import 'package:c_wire_app/src/models/platforms.dart';

class GameDetails {
  String _error;
  int _limit;
  int _offset;
  int _numberOfPageResults;
  int _numberOfTotalResults;
  int _statusCode;
  Results _results;
  String _version;

  GameDetails(
      {String error,
      int limit,
      int offset,
      int numberOfPageResults,
      int numberOfTotalResults,
      int statusCode,
      Results results,
      String version}) {
    this._error = error;
    this._limit = limit;
    this._offset = offset;
    this._numberOfPageResults = numberOfPageResults;
    this._numberOfTotalResults = numberOfTotalResults;
    this._statusCode = statusCode;
    this._results = results;
    this._version = version;
  }

  String get error => _error;
  set error(String error) => _error = error;
  int get limit => _limit;
  set limit(int limit) => _limit = limit;
  int get offset => _offset;
  set offset(int offset) => _offset = offset;
  int get numberOfPageResults => _numberOfPageResults;
  set numberOfPageResults(int numberOfPageResults) =>
      _numberOfPageResults = numberOfPageResults;
  int get numberOfTotalResults => _numberOfTotalResults;
  set numberOfTotalResults(int numberOfTotalResults) =>
      _numberOfTotalResults = numberOfTotalResults;
  int get statusCode => _statusCode;
  set statusCode(int statusCode) => _statusCode = statusCode;
  Results get results => _results;
  set results(Results results) => _results = results;
  String get version => _version;
  set version(String version) => _version = version;

  GameDetails.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _limit = json['limit'];
    _offset = json['offset'];
    _numberOfPageResults = json['number_of_page_results'];
    _numberOfTotalResults = json['number_of_total_results'];
    _statusCode = json['status_code'];
    _results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
    _version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this._error;
    data['limit'] = this._limit;
    data['offset'] = this._offset;
    data['number_of_page_results'] = this._numberOfPageResults;
    data['number_of_total_results'] = this._numberOfTotalResults;
    data['status_code'] = this._statusCode;
    if (this._results != null) {
      data['results'] = this._results.toJson();
    }
    data['version'] = this._version;
    return data;
  }
}

class Results {
  String _description;
  String _guid;
  int _id;
  Image _image;
  String _name;
  List<Platforms> _platforms;
  List<Images> _images;
  List<Genres> _genres;

  Results(
      {String description,
      String guid,
      int id,
      Image image,
      String name,
      List<Platforms> platforms,
      List<Images> images,
      List<Genres> genres}) {
    this._description = description;
    this._guid = guid;
    this._id = id;
    this._image = image;
    this._name = name;
    this._platforms = platforms;
    this._images = images;
    this._genres = genres;
  }

  String get description => _description;
  set description(String description) => _description = description;
  String get guid => _guid;
  set guid(String guid) => _guid = guid;
  int get id => _id;
  set id(int id) => _id = id;
  Image get image => _image;
  set image(Image image) => _image = image;
  String get name => _name;
  set name(String name) => _name = name;
  List<Platforms> get platforms => _platforms;
  set platforms(List<Platforms> platforms) => _platforms = platforms;
  List<Images> get images => _images;
  set images(List<Images> images) => _images = images;
  List<Genres> get genres => _genres;
  set genres(List<Genres> genres) => _genres = genres;

  Results.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
    _guid = json['guid'];
    _id = json['id'];
    _image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    _name = json['name'];
    if (json['platforms'] != null) {
      _platforms = new List<Platforms>();
      json['platforms'].forEach((v) {
        _platforms.add(new Platforms.fromJson(v));
      });
    }
    if (json['images'] != null) {
      _images = new List<Images>();
      json['images'].forEach((v) {
        _images.add(new Images.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      _genres = new List<Genres>();
      json['genres'].forEach((v) {
        _genres.add(new Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this._description;
    data['guid'] = this._guid;
    data['id'] = this._id;
    if (this._image != null) {
      data['image'] = this._image.toJson();
    }
    data['name'] = this._name;
    if (this._platforms != null) {
      data['platforms'] = this._platforms.map((v) => v.toJson()).toList();
    }
    if (this._images != null) {
      data['images'] = this._images.map((v) => v.toJson()).toList();
    }
    if (this._genres != null) {
      data['genres'] = this._genres.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
