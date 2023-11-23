import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit.dart';
import '../cubits/state.dart';
import '../widgets/article_item.dart';
import '../widgets/dividor.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var sportList = NewsCubit.get(context).sports;

        return ConditionalBuilder(
          condition: sportList.isNotEmpty,
          builder: (context) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>  ArticleItem(sportList[index]),
              separatorBuilder: (context, index) => separator(context),
              itemCount: sportList.length,
            );
          },
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
