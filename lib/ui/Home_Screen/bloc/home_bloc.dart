import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org/ui/Home_Screen/bloc/home_event.dart';
import 'package:org/ui/Home_Screen/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<PageChangeEvent>(onPageChangeEvent);
  }

  FutureOr<void> onPageChangeEvent(PageChangeEvent event, Emitter<HomeState> emit) {
    emit(
      state.copy(selectedIndex: event.selectedIndex ?? 0),
    );
  }
}
