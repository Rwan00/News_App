import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/cubit.dart';
import 'package:news_app/cubits/state.dart';
import 'package:news_app/widgets/article_item.dart';
import 'package:news_app/widgets/dividor.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context,state){
        return ConditionalBuilder(
        condition: state is! NewsGetBusinessLoadingState,
        builder: (context) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index) => const ArticleItem(),
             separatorBuilder: (context,index) => separator(context), 
             itemCount: 10,
             );
        },
        fallback: (context) => const Center(child: CircularProgressIndicator(),),
      );
      },
    );
  }
}
