import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newssapp/business.dart';
import 'package:newssapp/entertainment.dart';
import 'package:newssapp/sport.dart';

class TabsPage extends StatefulWidget {
  @override
  TabsPageState createState() {
    return TabsPageState();
  }
}

class TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(text: "Business"),
            Tab(text: "Sport"),
            Tab(text: "Entertainment")
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          BusinessStateFul(),
          SportStateFull(),
          EntertainmentStateFull()
        ],
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
