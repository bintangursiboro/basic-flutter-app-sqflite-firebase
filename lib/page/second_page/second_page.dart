import 'package:basic_flutter_app/page/second_page/bloc/second_page_bloc.dart';
import 'package:basic_flutter_app/page/second_page/bloc/second_page_event.dart';
import 'package:basic_flutter_app/page/second_page/second_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/second_page_state.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SecondPageBloc _bloc = SecondPageBloc();

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Function onPressed = (val) {
      _bloc.dispatch(AddMapEvent(maps: {'nama': val}));
    };

    return BlocListener<SecondPageBloc, SecondPageState>(
      listener: (context, SecondPageState state) {},
      child: BlocBuilder(
          bloc: _bloc,
          builder: (context, SecondPageState state) {
            return SecondPageView(
              controller: controller,
              onPressed: (val) {
                _bloc.dispatch(AddMapEvent(maps: {'nama': val}));
              },
              names: (state is SecondPageLoaded) ? state.lists : null,
            );
          }),
    );
  }
}
