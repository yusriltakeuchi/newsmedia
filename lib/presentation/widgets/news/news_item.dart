
import 'package:flutter/material.dart';
import 'package:newsmedia/config/constant.dart';
import 'package:newsmedia/data/models/news/news_model.dart';

class NewsItem extends StatelessWidget {
  final NewsModel? news;
  final VoidCallback? onClick;
  NewsItem({
    required this.news,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 2)
          )
        ]
      ),
      child: Material(
        type: MaterialType.transparency,
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onClick!(),
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _mediaWidget(),
              Padding(
                padding: EdgeInsets.only(left: setWidth(30), right: setWidth(30), top: setHeight(15), bottom: setHeight(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleWidget(),
                          SizedBox(height: setHeight(20)),
                          _authorWidget(),
                        ],
                      ),
                    ),
                    SizedBox(width: setWidth(30)),
                    _imageWidget()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _mediaWidget() {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomRight: Radius.circular(3)
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: setWidth(20), vertical: setHeight(10)),
          child: Row(
            children: [
              Icon(
                Icons.location_city, 
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: setWidth(10)),
              Text(
                news!.media!.name!,
                style: styleSubtitle.copyWith(
                  fontSize: setFontSize(33),
                  color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Text(
      news!.title!,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: styleTitle.copyWith(
        fontSize: setFontSize(38),
        height: 1.4
      ),
    );
  }

  Widget _authorWidget() {
    return Row(
      children: [
        Icon(Icons.account_circle, color: primaryColor, size: 16),
        SizedBox(width: setWidth(10)),
        Text(
          news!.author!,
          style: styleSubtitle.copyWith(
            fontSize: setFontSize(30)
          ),
        )
      ],
    );
  }

  Widget _imageWidget() {
    return Container(
      width: setWidth(200),
      height: setHeight(200),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            news!.imageUrl!
          ),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}
