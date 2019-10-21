import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageView extends StatefulWidget {
  final Function onTap;
  final TextEditingController controller;
  final Function onChanged;
  final bool isLoading;
  final String text;

  MainPageView(
      {this.onTap, this.controller, this.onChanged, this.text, this.isLoading});

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: widget.controller,
            onChanged: widget.onChanged,
          ),
          (!widget.isLoading)
              ? RaisedButton(
                  onPressed: () {
                    print('Button Pressed');
                    widget.onTap(widget.controller.text);
                  },
                )
              : CircularProgressIndicator(),
          Text(widget.text),
        ],
      ),
    ));
  }
}
