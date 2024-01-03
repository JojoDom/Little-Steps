part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

class HomeMenuItemsNavigateToPageActionState  extends HomeActionState{}
