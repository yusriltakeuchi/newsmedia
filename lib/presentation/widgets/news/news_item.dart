import 'package:flutter/material.dart';
import 'package:newsmedia/config/constant.dart';

import 'package:newsmedia/data/models/news/news_model.dart';

class NewsItem extends StatelessWidget {
  final NewsModel? news;
  NewsItem({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        news!.title!,
        style: styleTitle,
      ),
    );
  }
}
