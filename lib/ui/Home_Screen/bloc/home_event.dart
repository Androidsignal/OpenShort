


import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class PageChangeEvent extends HomeEvent {
  final int? selectedIndex;
  PageChangeEvent({this.selectedIndex});
  @override
  List<Object?> get props => [selectedIndex];
}
