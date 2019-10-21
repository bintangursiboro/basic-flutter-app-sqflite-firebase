import 'package:basic_flutter_app/page/main/service/firestore/main_page_firestore.dart';
import 'package:basic_flutter_app/page/main/service/sqflite/main_page_sqflite_service.dart';
import 'package:basic_flutter_app/utility/injector/injector.dart';
import 'package:bloc/bloc.dart';

import 'main_page_event.dart';
import 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  @override
  MainPageState get initialState => MainPageInitialize();

  @override
  Stream<MainPageState> mapEventToState(MainPageEvent event) async* {
    MainPageSqflite serviceSqflite = MainPageSqflite(
        db: await InjectorContaiener().getDatabaseHelper().database);

    HomePageFirestore serviceFirestore = HomePageFirestore();
    if (event is SubmitEvent) {
      yield MainPageLoading();
      try {
        await serviceFirestore.saveToFirestore(event.name);
        await serviceSqflite.insert(event.name).then((onValue) {
          print('Insert Succed');
        });
        await serviceSqflite.insertNim();
        // yield await serviceSqflite.fetch(1).then((response) {
        //   return MainPageLoaded(name: response.nim);
        // });
        yield await serviceFirestore.fetchFromFirestore().then((response) {
          return MainPageLoaded(name: response);
        });
      } catch (e) {
        print('Error case' + e.toString());
        yield MainPageError();
      }
    }
  }
}
