// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cache_manager/shared_preferences.dart';
import 'package:news_app/ui/business_screen.dart';
import 'package:news_app/ui/science_screen.dart';
import 'package:news_app/ui/settings.dart';
import 'package:news_app/ui/sports_screen.dart';
import 'package:news_app/web_services/web_services.dart';

import '../constants/constants.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  bool isDark = false;

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<dynamic> businessNews = [];
  List<dynamic> sportsNews = [];
  List<dynamic> scienceNews = [];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
    if (index == 1) {
      getSportsNews();
    }
    if (index == 2) {
      getScienceNews();
    }
  }

  final NewsWebServices _webServices = NewsWebServices();

  void getBusinessNews() {
    if (businessNews.isEmpty) {
      emit(LoadingBusinessNewsState());
      _webServices.getCategoryNews('business').then(
        (value) {
          businessNews = value['articles'];
          emit(BusinessNewsLoadedState());
        },
      ).catchError((error) {
        print(error.toString());
        emit(BusinessNewsErrorState(error.toString()));
      });
    } else {
      emit(BusinessNewsLoadedState());
    }
  }

  void getSportsNews() {
    if (sportsNews.isEmpty) {
      emit(LoadingSportsNewsState());
      _webServices.getCategoryNews('sports').then(
        (value) {
          sportsNews = value['articles'];
          emit(SportsNewsLoadedState());
        },
      ).catchError((error) {
        print(error.toString());
        emit(SportsNewsErrorState(error.toString()));
      });
    } else {
      emit(SportsNewsLoadedState());
    }
  }

  void getScienceNews() {
    if (scienceNews.isEmpty) {
      emit(LoadingScienceNewsState());
      _webServices.getCategoryNews('science').then(
        (value) {
          scienceNews = value['articles'];
          emit(ScienceNewsLoadedState());
        },
      ).catchError((error) {
        print(error.toString());
        emit(ScienceNewsErrorState(error.toString()));
      });
    } else {
      emit(ScienceNewsLoadedState());
    }
  }

  String urlToImage(String? image) {
    if (image == null) {
      return noImagePlaceholder;
    } else if (image.startsWith('https://www.aljazeera') || image.startsWith('https://www.alquds')) {
      return noImagePlaceholder;
    } else {
      return image;
    }
  }

  void switchThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheManager.setData('isDark', isDark).then(
        (value) => emit(SwitchThemeModeState()),
      );
    }
  }
}
