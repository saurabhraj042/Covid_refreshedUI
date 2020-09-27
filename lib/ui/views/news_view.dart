import 'package:covid_refreshed/core/models/models.dart';
import 'package:covid_refreshed/core/services/news_api_service.dart';
import 'package:covid_refreshed/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  Future<News> _data;

  @override
  void initState() {
    _data = getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("--status 200 ---NewsView()");
              News _parsedData = snapshot.data;
              return NewsViewWidget(
                data: _parsedData,
              );
            } else if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Center(
                child: Text("Error"),
              );
            } else {
              print("--loading ---NewsView()");
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class NewsViewWidget extends StatelessWidget {
  final News data;

  const NewsViewWidget({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        Article article = data.articles[index];
        return NewsCard(
          dataArticle: article,
        );
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  final Article dataArticle;

  const NewsCard({Key key, this.dataArticle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.50,
      height: 400,
      child: Card(
        //margin: EdgeInsets.all(31),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: width,
              height: 200,
              child: Image.network(dataArticle.urlToImage),
            ),
            Text(dataArticle.title.toString()),
            Text(dataArticle.description.toString()),
          ],
        ),
      ),
    );
  }
}
