import 'package:equatable/equatable.dart';

abstract class MainPageState extends Equatable {
  MainPageState([List props = const []]) : super(props);
}

class MainPageLoading extends MainPageState {}

class MainPageLoaded extends MainPageState {
  final bool isSaved;
  final String name;
  MainPageLoaded({this.isSaved, this.name}) : super([isSaved, name]);
}

class MainPageError extends MainPageState {}

class MainPageInitialize extends MainPageState {}
