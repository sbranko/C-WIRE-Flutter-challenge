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
