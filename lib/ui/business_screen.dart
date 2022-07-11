import 'dart:convert';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';

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
              //TODO: Continue here..
              itemBuilder: (context, index) {return const SizedBox();},
              separatorBuilder: (context,index) => const Divider(),
              itemCount: cubit.businessNews.length,
            );
          },
          fallback: (context) => const CircularProgressIndicator(),
        );
      },
    );
  }
}
