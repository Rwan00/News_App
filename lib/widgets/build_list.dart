import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/article_item.dart';
import 'package:news_app/widgets/divider.dart';

class BuildList extends StatelessWidget {
  const BuildList({
    super.key,
    required this.itemsList,
    required this.isSearch,  this.isMobile = true,
  });

  final List itemsList;
  final bool isSearch;
   final bool? isMobile ;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: itemsList.isNotEmpty,
      builder: (context) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => ArticleItem(itemsList[index],index: index, isMobile: isMobile!,),
          separatorBuilder: (context, index) => const MySeparetor(),
          itemCount: itemsList.length,
        );
      },
      fallback: (context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
