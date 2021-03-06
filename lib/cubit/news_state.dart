part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class ChangeBottomNavBarState extends NewsState {}


class GetBusinessNewsState extends NewsState {}

class GetScienceNewsState extends NewsState {}

class GetSportsNewsState extends NewsState {}

class LoadingBusinessNewsState extends NewsState {}

class BusinessNewsLoadedState extends NewsState {}

class BusinessNewsErrorState extends NewsState {
  final String error;
  BusinessNewsErrorState(this.error);
}

class LoadingSportsNewsState extends NewsState {}

class SportsNewsLoadedState extends NewsState {}

class SportsNewsErrorState extends NewsState {
  final String error;
  SportsNewsErrorState(this.error);
}

class LoadingScienceNewsState extends NewsState {}

class ScienceNewsLoadedState extends NewsState {}


class ScienceNewsErrorState extends NewsState {
  final String error;
  ScienceNewsErrorState(this.error);
}

class LoadingSearchNewsState extends NewsState {}

class SearchNewsLoadedState extends NewsState {}

class SearchNewsErrorState extends NewsState {
  final String error;
  SearchNewsErrorState(this.error);
}

class SwitchThemeModeState extends NewsState {}