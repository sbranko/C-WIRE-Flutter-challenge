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
