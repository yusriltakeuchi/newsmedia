
import 'package:newsmedia/data/models/news/news_model.dart';
import 'package:newsmedia/data/services/news/news_services.dart';
import 'package:newsmedia/injector.dart';

class NewsRepository {

  /// Initialize injector
  final newsServices = injector<NewsServices>();

  /// Get headlines with dynamic parameter
  Future<List<NewsModel>> getHeadlines({Map<String, dynamic>? param}) async {
    try {
      var response = await newsServices.getHeadline(param: param);
      List<NewsModel> _news = [];

      /// Check data first before convert to model
      if (response.isNotEmpty && response.containsKey("articles")) {
        _news = (response['articles'] as List).map((_news) => NewsModel.fromJson(_news)).toList();
      }
      return _news;
    } catch(e) {
      throw e.toString();
    }
  }
}