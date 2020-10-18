import 'package:covid_refreshed/core/models/models.dart';
import 'package:covid_refreshed/core/services/news_api_service.dart';
import 'package:covid_refreshed/ui/shared/colors.dart';
import 'package:covid_refreshed/ui/widgets/drawer.dart';
import 'package:flutter/material.dart';

var newsHeaderTextStyle = new TextStyle(
  fontWeight: FontWeight.bold,
);

var appBarHeading = new Text(
  "News",
  style: TextStyle(
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  ),
);

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
      drawer: DrawerWidget(),
      backgroundColor: Palette.primaryColor,
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        elevation: 0,
        title: appBarHeading,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 20),
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
      width: width,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 200,
              child: Image.network(dataArticle.urlToImage),
            ),
            Text(
              dataArticle.title.toString(),
              style: newsHeaderTextStyle,
              textAlign: TextAlign.center,
            ),
            Text(dataArticle.description.toString()),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
