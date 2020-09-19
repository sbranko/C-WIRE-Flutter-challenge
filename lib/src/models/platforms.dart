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
