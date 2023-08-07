
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int? selectedIndex;

  const HomeState({this.selectedIndex});

  HomeState copy({
    required int selectedIndex,
}) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex];
}