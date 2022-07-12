import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/my_widgets/article.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return ConditionalBuilder(
          condition: state is! LoadingBusinessNewsState,
          builder: (context) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Article(
                  image: cubit.businessNews[index]['urlToImage'] ??
                      noImagePlaceholder,
                  url: cubit.businessNews[index]['url'],
                  title: cubit.businessNews[index]['title'],
                  date: cubit.businessNews[index]['publishedAt'],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cubit.businessNews.length,
            );
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
