import 'package:basic_flutter_app/db/database_migration.dart';
import 'package:basic_flutter_app/page/main/bloc/main_page_bloc.dart';
import 'package:basic_flutter_app/page/main/main_page.dart';
import 'package:basic_flutter_app/utility/database/database_helper.dart';
import 'package:basic_flutter_app/utility/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(InitApp());
}

class InitApp extends StatelessWidget {
  Future init() async {
    InjectorContaiener injectorContaiener = InjectorContaiener();
    injectorContaiener.initInjection();
    DatabaseHelper dbHelper = InjectorContaiener().getDatabaseHelper();
    dbHelper.open();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Basic SQFlite',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Basic App'),
          ),
          body: BlocProvider<MainPageBloc>(
            builder: (context) => MainPageBloc(),
            child: FutureBuilder(
              future: init(),
              builder: (context, snapshot) {
                return MainPage();
              },
            ),
          ),
        ));
  }
}
