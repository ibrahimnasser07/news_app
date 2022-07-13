import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/my_widgets/article.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                cubit.searchNews = [];
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: cubit.isDark ? HexColor('D6D5A8') : Colors.black,
              ),
            ),
            title: TextField(
              onChanged: (value) {
                cubit.getSearchNews(value);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: cubit.isDark ? HexColor('816797') : Colors.black45,
                  fontSize: 20,
                ),
                border: InputBorder.none,
              ),
              style: Theme.of(context).textTheme.bodyText1,
              cursorColor: cubit.isDark ? HexColor('D6D5A8') : Colors.black54,
              autofocus: true,
            ),
          ),
          body: ConditionalBuilder(
            condition: state is! LoadingSearchNewsState,
            builder: (context) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Article(
                    image: cubit
                        .urlToImage(cubit.searchNews[index]['urlToImage']),
                    url: cubit.searchNews[index]['url'],
                    title: cubit.searchNews[index]['title'],
                    date: cubit.searchNews[index]['publishedAt'],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: cubit.searchNews.length,
              );
            },
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
