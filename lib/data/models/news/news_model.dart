
import 'package:newsmedia/data/models/media/media_model.dart';

class NewsModel {
  MediaModel? media;
  String? author;
  String? title;
  String? description;
  String? imageUrl;
  String? content;

  NewsModel({
    this.media,
    this.author,
    this.title,
    this.description,
    this.imageUrl,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      media: json['source'] != null ? MediaModel.fromJson(json['source']) : null,
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      imageUrl: json['urlToImage'] ?? "",
      content: json['content'] ?? ""
    );
  }
}
