part of 'homescreenbloc_bloc.dart';

@immutable
abstract class HomescreenblocEvent {}

class FloatingActionButtonPressedEvent extends HomescreenblocEvent {}

class ContainerVisibleOnFloatingActionButtonPressedEvent extends HomescreenblocEvent {}

class ContainerHideOnFloatingActionButtonPressedEvent extends HomescreenblocEvent {}

class TextInContainerShownWhenContainerVisibleEvent extends HomescreenblocEvent {}

class TextInContainerHideWhenContainerHide extends HomescreenblocEvent {}

class AddDataToListEvent extends HomescreenblocEvent {
  final String data;

  AddDataToListEvent(this.data);
}

