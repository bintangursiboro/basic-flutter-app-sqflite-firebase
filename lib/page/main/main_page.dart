import 'package:basic_flutter_app/page/main/bloc/main_page_bloc.dart';
import 'package:basic_flutter_app/page/main/bloc/main_page_event.dart';
import 'package:basic_flutter_app/page/main/main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/main_page_state.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageBloc _bloc = MainPageBloc();
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Function onSave = (String name) {
      if (name != null) {
        _bloc.dispatch(SubmitEvent(name: name));
      }
    };

    return BlocListener(
      listener: (BuildContext context, MainPageState state) {},
      bloc: _bloc,
      child: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, MainPageState state) {
          return MainPageView(
            controller: controller,
            onTap: (val) {
              print('Function on');
              print(val);
              _bloc.dispatch(SubmitEvent(name: val));
            },
            isLoading: (state is MainPageLoading) ? true : false,
            text: (state is MainPageLoaded) ? state.name : '',
          );
        },
      ),
    );
  }
}
