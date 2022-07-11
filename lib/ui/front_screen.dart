// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/web_services/web_services.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, NewsState state) {},
      builder: (BuildContext context, NewsState state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottomNav(index),
            showUnselectedLabels: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              NewsWebServices()
                  .getNewsData({'country': 'eg', 'category': 'sports'}).then(
                      (value) => print(value['articles'][0]['title']));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
