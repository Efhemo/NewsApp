import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SportStateFull extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SportState();
  }
}

class SportState extends State<SportStateFull> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
          child: Text("Sport"),
          onPressed: () {
            print("Sport was pressed");
          }),
    );
  }
}
