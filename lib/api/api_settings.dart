class ApiSetting {
  static const String _baseUrl = 'https://colorz.co.il/shcool/';
  static const String _apiUrl = _baseUrl + 'api/';

  static const String department = _apiUrl + 'departments/{id}';
  static const String album = _apiUrl + 'album/{id}';
  static const String images = _apiUrl + 'images/{id}';
  static const String videos = _apiUrl + 'videos/{id}';
  static const String course = _apiUrl + 'courses/{id}';
  static const String sliders = _apiUrl + 'sliders/{id}';


  static const String cities = _apiUrl + 'cities';
  static const String classes = _apiUrl + 'classes';
}
