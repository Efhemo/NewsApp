import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newssapp/constant.dart';
import 'package:newssapp/news.dart';
import 'package:newssapp/newsitem.dart';

class EntertainmentStateFull extends StatefulWidget {
  @override
  EntertainmentState createState() {
    return EntertainmentState();
  }
}

class EntertainmentState extends State<EntertainmentStateFull>
    with AutomaticKeepAliveClientMixin {
  var _isLoading = true;

  final url =
      Constant.base_url + Constant.entertainment_category + Constant.key;

  List<dynamic> news;

  @override
  void initState() {
    super.initState();
    news = new List();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading ? new CircularProgressIndicator() : newsContainer(news),
    );
  }

  Widget newsContainer(List<dynamic> news) {
    //if news list is empty, show refresh button
    return Container(
        child: news.isEmpty
            ? Center(
          child: RaisedButton(
            child: Text("Refresh"),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _fetchData();
            },
          ),
        )
            : ListView.builder(
            itemCount: this.news != null ? this.news.length : 0,
            itemBuilder: (context, i) {
              return NewsCel(News.fromJson(this.news[i]));
            }));
  }

  void _fetchData() async {
    print("Attempting to fetch internent");

    try {
      var response = await http
          .get(url); // wait for the response/ returns Future<Response>

      if (response.statusCode == 200) {
        print("my respnse " + response.body);

        var resBody = json.decode(response.body); // return a map
        setState(() {
          news = resBody["articles"]; //return an array
          _isLoading = false;
        });
      }
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
