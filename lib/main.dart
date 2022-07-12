import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/ui/front_screen.dart';

import 'my_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessNews(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('1B2430'),
              appBarTheme: AppBarTheme(
                titleSpacing: 15,
                backgroundColor: HexColor('1B2430'),
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: HexColor('D6D5A8'),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                actionsIconTheme: IconThemeData(color: HexColor('D6D5A8')),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('1B2430'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              progressIndicatorTheme: ProgressIndicatorThemeData(
                color: HexColor('D6D5A8'),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: HexColor('D6D5A8'),
                unselectedItemColor: HexColor('51557E'),
                backgroundColor: HexColor('1B2430'),
                type: BottomNavigationBarType.fixed,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HexColor('D6D5A8'),
                  fontSize: 18,
                ),
                subtitle1: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: HexColor('816797'),
                  fontSize: 12,
                ),
              ),
            ),
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.black45,
                type: BottomNavigationBarType.fixed,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                titleSpacing: 15,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
                subtitle1: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black45,
                  fontSize: 12,
                ),
              ),
            ),
            themeMode: cubit.myTheme,
            home: const FrontScreen(),
          );
        },
      ),
    );
  }
}
