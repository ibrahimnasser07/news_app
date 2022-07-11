// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/business_screen.dart';
import 'package:news_app/ui/science_screen.dart';
import 'package:news_app/ui/settings.dart';
import 'package:news_app/ui/sports_screen.dart';
import 'package:news_app/web_services/web_services.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Business'),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<dynamic> businessNews = [];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  final NewsWebServices _webServices = NewsWebServices();

  void getBusinessNews() {
    emit(LoadingBusinessNewsState());
    _webServices.getCategoryNews('business').then(
      (value) {
        businessNews = value['articles'];
        print(value['articles'][0]['title']);
        emit(BusinessNewsLoadedState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(BusinessNewsErrorState(error.toString()));
    });
  }
}
