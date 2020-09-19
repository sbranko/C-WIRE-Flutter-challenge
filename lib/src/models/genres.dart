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
