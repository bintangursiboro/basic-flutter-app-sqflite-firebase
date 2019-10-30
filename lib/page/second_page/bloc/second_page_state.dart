import 'package:equatable/equatable.dart';

abstract class SecondPageState extends Equatable {
  SecondPageState([List props = const []]) : super(props);
}

class SecondPageIntial extends SecondPageState {}

class SecondPageLoaded extends SecondPageState {
  List<String> lists = [];
  SecondPageLoaded({this.lists}) : super([lists]);

  SecondPageLoaded copyWith({List<String> newLists}) {
    return SecondPageLoaded(lists: newLists ?? lists);
  }
}

class SecondPageLoading extends SecondPageState {}

class SecondPageError extends SecondPageState {}
