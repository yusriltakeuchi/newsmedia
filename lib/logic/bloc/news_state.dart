part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel>? news;
  NewsLoaded({
    this.news
  });
}

class NewsFailure extends NewsState {
  final String? message;
  NewsFailure({
    this.message,
  });
}
