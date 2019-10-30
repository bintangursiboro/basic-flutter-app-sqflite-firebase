import 'package:basic_flutter_app/db/database_migration.dart';
import 'package:basic_flutter_app/page/main/bloc/main_page_bloc.dart';
import 'package:basic_flutter_app/page/main/main_page.dart';
import 'package:basic_flutter_app/page/second_page/bloc/second_page_bloc.dart';
import 'package:basic_flutter_app/page/second_page/second_page.dart';
import 'package:basic_flutter_app/utility/database/database_helper.dart';
import 'package:basic_flutter_app/utility/injector/injector.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
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
          appBar: PreferredSize(
            preferredSize: Size(null, 100),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
              ]),
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Container(
                  color: Colors.blueAccent,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.navigate_before,
                          size: 40,
                          color: Colors.white,
                        ),
                        Text(
                          "Basic App",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Icon(
                          Icons.navigate_before,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: MultiBlocProvider(
            providers: <BlocProvider>[
              BlocProvider<MainPageBloc>(
                builder: (BuildContext context) => MainPageBloc(),
              ),
              BlocProvider<SecondPageBloc>(
                builder: (BuildContext context) => SecondPageBloc(),
              ),
            ],
            child: FutureBuilder(
              future: init(),
              builder: (context, snapshot) {
                return SecondPage();
              },
            ),
          ),
        ));
  }
}
