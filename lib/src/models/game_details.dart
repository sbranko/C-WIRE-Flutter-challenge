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

class Images {
  String _iconUrl;
  String _mediumUrl;
  String _screenUrl;
  String _smallUrl;
  String _superUrl;
  String _thumbUrl;
  String _tinyUrl;
  String _original;
  String _tags;

  Images(
      {String iconUrl,
      String mediumUrl,
      String screenUrl,
      String smallUrl,
      String superUrl,
      String thumbUrl,
      String tinyUrl,
      String original,
      String tags}) {
    this._iconUrl = iconUrl;
    this._mediumUrl = mediumUrl;
    this._screenUrl = screenUrl;
    this._smallUrl = smallUrl;
    this._superUrl = superUrl;
    this._thumbUrl = thumbUrl;
    this._tinyUrl = tinyUrl;
    this._original = original;
    this._tags = tags;
  }

  String get iconUrl => _iconUrl;
  set iconUrl(String iconUrl) => _iconUrl = iconUrl;
  String get mediumUrl => _mediumUrl;
  set mediumUrl(String mediumUrl) => _mediumUrl = mediumUrl;
  String get screenUrl => _screenUrl;
  set screenUrl(String screenUrl) => _screenUrl = screenUrl;
  String get smallUrl => _smallUrl;
  set smallUrl(String smallUrl) => _smallUrl = smallUrl;
  String get superUrl => _superUrl;
  set superUrl(String superUrl) => _superUrl = superUrl;
  String get thumbUrl => _thumbUrl;
  set thumbUrl(String thumbUrl) => _thumbUrl = thumbUrl;
  String get tinyUrl => _tinyUrl;
  set tinyUrl(String tinyUrl) => _tinyUrl = tinyUrl;
  String get original => _original;
  set original(String original) => _original = original;
  String get tags => _tags;
  set tags(String tags) => _tags = tags;

  Images.fromJson(Map<String, dynamic> json) {
    _iconUrl = json['icon_url'];
    _mediumUrl = json['medium_url'];
    _screenUrl = json['screen_url'];
    _smallUrl = json['small_url'];
    _superUrl = json['super_url'];
    _thumbUrl = json['thumb_url'];
    _tinyUrl = json['tiny_url'];
    _original = json['original'];
    _tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon_url'] = this._iconUrl;
    data['medium_url'] = this._mediumUrl;
    data['screen_url'] = this._screenUrl;
    data['small_url'] = this._smallUrl;
    data['super_url'] = this._superUrl;
    data['thumb_url'] = this._thumbUrl;
    data['tiny_url'] = this._tinyUrl;
    data['original'] = this._original;
    data['tags'] = this._tags;
    return data;
  }
}

class Genres {
  String _apiDetailUrl;
  int _id;
  String _name;
  String _siteDetailUrl;

  Genres({String apiDetailUrl, int id, String name, String siteDetailUrl}) {
    this._apiDetailUrl = apiDetailUrl;
    this._id = id;
    this._name = name;
    this._siteDetailUrl = siteDetailUrl;
  }

  String get apiDetailUrl => _apiDetailUrl;
  set apiDetailUrl(String apiDetailUrl) => _apiDetailUrl = apiDetailUrl;
  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get siteDetailUrl => _siteDetailUrl;
  set siteDetailUrl(String siteDetailUrl) => _siteDetailUrl = siteDetailUrl;

  Genres.fromJson(Map<String, dynamic> json) {
    _apiDetailUrl = json['api_detail_url'];
    _id = json['id'];
    _name = json['name'];
    _siteDetailUrl = json['site_detail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_detail_url'] = this._apiDetailUrl;
    data['id'] = this._id;
    data['name'] = this._name;
    data['site_detail_url'] = this._siteDetailUrl;
    return data;
  }
}
