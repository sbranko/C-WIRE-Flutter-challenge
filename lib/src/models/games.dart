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

class Image {
  String _iconUrl;
  String _mediumUrl;
  String _screenUrl;
  String _screenLargeUrl;
  String _smallUrl;
  String _superUrl;
  String _thumbUrl;
  String _tinyUrl;
  String _originalUrl;
  String _imageTags;

  Image(
      {String iconUrl,
      String mediumUrl,
      String screenUrl,
      String screenLargeUrl,
      String smallUrl,
      String superUrl,
      String thumbUrl,
      String tinyUrl,
      String originalUrl,
      String imageTags}) {
    this._iconUrl = iconUrl;
    this._mediumUrl = mediumUrl;
    this._screenUrl = screenUrl;
    this._screenLargeUrl = screenLargeUrl;
    this._smallUrl = smallUrl;
    this._superUrl = superUrl;
    this._thumbUrl = thumbUrl;
    this._tinyUrl = tinyUrl;
    this._originalUrl = originalUrl;
    this._imageTags = imageTags;
  }

  String get iconUrl => _iconUrl;
  set iconUrl(String iconUrl) => _iconUrl = iconUrl;
  String get mediumUrl => _mediumUrl;
  set mediumUrl(String mediumUrl) => _mediumUrl = mediumUrl;
  String get screenUrl => _screenUrl;
  set screenUrl(String screenUrl) => _screenUrl = screenUrl;
  String get screenLargeUrl => _screenLargeUrl;
  set screenLargeUrl(String screenLargeUrl) => _screenLargeUrl = screenLargeUrl;
  String get smallUrl => _smallUrl;
  set smallUrl(String smallUrl) => _smallUrl = smallUrl;
  String get superUrl => _superUrl;
  set superUrl(String superUrl) => _superUrl = superUrl;
  String get thumbUrl => _thumbUrl;
  set thumbUrl(String thumbUrl) => _thumbUrl = thumbUrl;
  String get tinyUrl => _tinyUrl;
  set tinyUrl(String tinyUrl) => _tinyUrl = tinyUrl;
  String get originalUrl => _originalUrl;
  set originalUrl(String originalUrl) => _originalUrl = originalUrl;
  String get imageTags => _imageTags;
  set imageTags(String imageTags) => _imageTags = imageTags;

  Image.fromJson(Map<String, dynamic> json) {
    _iconUrl = json['icon_url'];
    _mediumUrl = json['medium_url'];
    _screenUrl = json['screen_url'];
    _screenLargeUrl = json['screen_large_url'];
    _smallUrl = json['small_url'];
    _superUrl = json['super_url'];
    _thumbUrl = json['thumb_url'];
    _tinyUrl = json['tiny_url'];
    _originalUrl = json['original_url'];
    _imageTags = json['image_tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon_url'] = this._iconUrl;
    data['medium_url'] = this._mediumUrl;
    data['screen_url'] = this._screenUrl;
    data['screen_large_url'] = this._screenLargeUrl;
    data['small_url'] = this._smallUrl;
    data['super_url'] = this._superUrl;
    data['thumb_url'] = this._thumbUrl;
    data['tiny_url'] = this._tinyUrl;
    data['original_url'] = this._originalUrl;
    data['image_tags'] = this._imageTags;
    return data;
  }
}

class Platforms {
  String _apiDetailUrl;
  int _id;
  String _name;
  String _siteDetailUrl;
  String _abbreviation;

  Platforms(
      {String apiDetailUrl,
      int id,
      String name,
      String siteDetailUrl,
      String abbreviation}) {
    this._apiDetailUrl = apiDetailUrl;
    this._id = id;
    this._name = name;
    this._siteDetailUrl = siteDetailUrl;
    this._abbreviation = abbreviation;
  }

  String get apiDetailUrl => _apiDetailUrl;
  set apiDetailUrl(String apiDetailUrl) => _apiDetailUrl = apiDetailUrl;
  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get siteDetailUrl => _siteDetailUrl;
  set siteDetailUrl(String siteDetailUrl) => _siteDetailUrl = siteDetailUrl;
  String get abbreviation => _abbreviation;
  set abbreviation(String abbreviation) => _abbreviation = abbreviation;

  Platforms.fromJson(Map<String, dynamic> json) {
    _apiDetailUrl = json['api_detail_url'];
    _id = json['id'];
    _name = json['name'];
    _siteDetailUrl = json['site_detail_url'];
    _abbreviation = json['abbreviation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_detail_url'] = this._apiDetailUrl;
    data['id'] = this._id;
    data['name'] = this._name;
    data['site_detail_url'] = this._siteDetailUrl;
    data['abbreviation'] = this._abbreviation;
    return data;
  }
}
