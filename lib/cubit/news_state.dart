part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class ChangeBottomNavBarState extends NewsState {}

class LoadingBusinessNewsState extends NewsState {}

class BusinessNewsLoadedState extends NewsState {}

class BusinessNewsErrorState extends NewsState {
  final String error;
  BusinessNewsErrorState(this.error);
}

class GetSportsNewsState extends NewsState {}

class GetScienceNewsState extends NewsState {}


