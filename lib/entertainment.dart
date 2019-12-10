import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntertainmentStateFull extends StatefulWidget {
  @override
  EntertainmentState createState() {
    return EntertainmentState();
  }
}

class EntertainmentState extends State<EntertainmentStateFull> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
          child: Text("Entertainment"),
          onPressed: () {
            print("Entertainment was pressed");
          }),
    );
  }
}
