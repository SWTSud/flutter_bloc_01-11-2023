part of 'homescreenbloc_bloc.dart';

@immutable
abstract class HomescreenblocState {}

class HomescreenblocInitial extends HomescreenblocState {}

class FloatingActionButtonPressedState extends HomescreenblocState {}

class ContainerVisibleOnFloatingActionButtonPressedState extends HomescreenblocState {
  ContainerVisibleOnFloatingActionButtonPressedState(List<dynamic> list);
}

class ContainerHideOnFloatingActionButtonPressedState extends HomescreenblocState {}

class TextInContainerShownWhenContainerVisibleState extends HomescreenblocState {}

class TextInContainerHideWhenContainerHideState extends HomescreenblocState {}

class DataAddedToListState extends HomescreenblocState {
  final List<String> items;

  DataAddedToListState(this.items);
}

