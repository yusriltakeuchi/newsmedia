
class APIEndpoint {

  /// Base API Endpoint
  static String? _baseHost = "https://newsapi.org/v2";

  /// Headline
  String getHeadline = "$_baseHost/top-headlines";
}