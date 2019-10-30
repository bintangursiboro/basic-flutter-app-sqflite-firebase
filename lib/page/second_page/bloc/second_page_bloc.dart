import 'package:bloc/bloc.dart';

import 'second_page_event.dart';
import 'second_page_state.dart';

class SecondPageBloc extends Bloc<SecondPageEvent, SecondPageState> {
  @override
  SecondPageState get initialState => SecondPageIntial();

  @override
  Stream<SecondPageState> mapEventToState(SecondPageEvent event) async* {
    if (event is AddMapEvent) {
      SecondPageLoaded currState = (currentState is SecondPageLoaded)
          ? currentState
          : SecondPageLoaded(lists: []);

      List<String> currLists = currState.lists;

      yield SecondPageLoading();

      try {
        // List<String> currLists = [];
        // currLists = currLists + currState.lists;
        // print(currLists.length);
        event.maps.forEach((key, val) {
          currLists.add(val);
        });
        yield currState.copyWith(newLists: currLists);
      } catch (e) {
        yield SecondPageError();
      }
    }
  }
}
