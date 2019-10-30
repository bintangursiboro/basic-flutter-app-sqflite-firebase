import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPageView extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onPressed;
  final List<String> names;

  SecondPageView(
      {@required this.controller, @required this.onPressed, this.names});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller,
            ),
            FlatButton(
              child: Text('Press'),
              onPressed: () {
                onPressed(controller.text);
              },
            ),
            (names == null) ? Container() : Text(names.last)
          ],
        ),
      ),
    );
  }
}
