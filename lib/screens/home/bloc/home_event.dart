part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeMenuItemsOnTapEvent extends HomeEvent {
  final String tag;

  HomeMenuItemsOnTapEvent(this.tag);
}
