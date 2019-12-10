import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newssapp/detail.dart';
import 'package:newssapp/news.dart';

class NewsCel extends StatelessWidget {
  final News news;

  NewsCel(this.news);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(4.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Image.network(
                    news.urlImage == null ? "" : news.urlImage,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, top: 4.0, right: 2.0, bottom: 2.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: new Text(
                                news.title == null ? "No Authour" : news.title,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          new Text(news.content == null
                              ? "No Content"
                              : news.content)
                        ]),
                  ),
                  new Divider()
                ],
              ),
            )
          ]),
      onPressed: () {
        print("i was pressed");
        navigateToDetail(context, news.title, news.url);
      },
    );
  }

  void navigateToDetail(BuildContext context, String title, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return new DetailPage(news.title, news.url);
    }));
  }
}
