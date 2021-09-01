import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsmedia/config/constant.dart';
import 'package:newsmedia/data/models/news/news_model.dart';
import 'package:newsmedia/logic/bloc/news_bloc.dart';
import 'package:newsmedia/presentation/widgets/news/news_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Media"),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  void loadNews() {
    context.read<NewsBloc>().add(NewsFetching());
  }

  @override
  void initState() {
    super.initState();
    this.loadNews();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        
        if (state is NewsLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is NewsFailure) {
          return Center(
            child: Text(
              state.message!,
              style: styleSubtitle.copyWith(
                fontSize: setFontSize(35)
              ),
            ),
          );
        }

        if (state is NewsLoaded) {
          return _newsList(state.news);
        }
        return SizedBox();
      },
    );
  }

  Widget _newsList(List<NewsModel>? _news) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _news?.length,
      itemBuilder: (context, index) {
        return NewsItem(
          news: _news?[index],
          onClick: () {},
        );        
      },
    );
  }
}