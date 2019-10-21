import 'package:equatable/equatable.dart';

abstract class MainPageEvent extends Equatable {
  MainPageEvent([List props = const []]) : super(props);
}

class SubmitEvent extends MainPageEvent {
  final String name;
  SubmitEvent({this.name}) : super([name]);
}
