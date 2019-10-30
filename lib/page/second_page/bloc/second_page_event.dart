import 'package:equatable/equatable.dart';

abstract class SecondPageEvent extends Equatable {
  SecondPageEvent([List props = const []]) : super(props);
}

class AddMapEvent extends SecondPageEvent {
  Map<String, dynamic> maps;
  AddMapEvent({this.maps}) : super([maps]);
}
