import 'package:c_wire_app/src/models/image.dart';
import 'package:c_wire_app/src/models/platforms.dart';

class Games {
  String _error;
  int _limit;
  int _offset;
  int _numberOfPageResults;
  int _numberOfTotalResults;
  int _statusCode;
  List<Results> _results;
  String _version;

  Games(
      {String error,
      int limit,
      int offset,
      int numberOfPageResults,
      int numberOfTotalResults,
      int statusCode,
      List<Results> results,
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
  List<Results> get results => _results;
  set results(List<Results> results) => _results = results;
  String get version => _version;
  set version(String version) => _version = version;

  Games.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _limit = json['limit'];
    _offset = json['offset'];
    _numberOfPageResults = json['number_of_page_results'];
    _numberOfTotalResults = json['number_of_total_results'];
    _statusCode = json['status_code'];
    if (json['results'] != null) {
      _results = new List<Results>();
      json['results'].forEach((v) {
        _results.add(new Results.fromJson(v));
      });
    }
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
      data['results'] = this._results.map((v) => v.toJson()).toList();
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
  String _resourceType;

  Results(
      {String description,
      String guid,
      int id,
      Image image,
      String name,
      List<Platforms> platforms,
      String resourceType}) {
    this._description = description;
    this._guid = guid;
    this._id = id;
    this._image = image;
    this._name = name;
    this._platforms = platforms;
    this._resourceType = resourceType;
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
  String get resourceType => _resourceType;
  set resourceType(String resourceType) => _resourceType = resourceType;

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
    _resourceType = json['resource_type'];
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
    data['resource_type'] = this._resourceType;
    return data;
  }
}
