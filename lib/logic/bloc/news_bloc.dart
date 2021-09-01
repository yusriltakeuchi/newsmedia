import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsmedia/data/models/news/news_model.dart';
import 'package:newsmedia/data/repositories/news/news_repository.dart';
import 'package:newsmedia/injector.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  /// Repositories for any news data source
  final newsRepository = injector<NewsRepository>();
  NewsBloc() : super(NewsInitial());
  
  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is NewsFetching) {
      yield*_getNews();
    }
  }
  
  /// Get list of news based on filter
  Stream<NewsState> _getNews() async* {
    yield NewsLoading();
    try {
      /// Set filter to get news
      var filter = FilterNewsModel();
      filter.page = 1;
      filter.country = "id";
      List<NewsModel> _news = await newsRepository.getNews(param: filter.toJson());
      yield NewsLoaded(news: _news);
    } catch(e) {
      yield NewsFailure(
        message: "Gagal mendapatkan berita"
      );
    }
  }
}
