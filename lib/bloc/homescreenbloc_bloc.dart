import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homescreenbloc_event.dart';
part 'homescreenbloc_state.dart';

class HomescreenblocBloc extends Bloc<HomescreenblocEvent, HomescreenblocState> {
  bool isContainerVisible = false;
  List<String> items = [];

  HomescreenblocBloc() : super(HomescreenblocInitial()) {
    on<FloatingActionButtonPressedEvent>((event, emit) {
      isContainerVisible = !isContainerVisible;
      if (isContainerVisible) {
        emit(ContainerVisibleOnFloatingActionButtonPressedState(List.from(items)));
            } else {
            emit(ContainerHideOnFloatingActionButtonPressedState());
            }
        });

    on<AddDataToListEvent>((event, emit) {
      items.add(event.data);
      emit(DataAddedToListState(List.from(items)));
      });
  }
}





