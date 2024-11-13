import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/state.dart';

import '../cubits/cubit.dart';
import '../methods/nav_method.dart';
import '../screens/web_view_screen.dart';

class ArticleItem extends StatelessWidget {
  final dynamic article;
  final int index;
  const ArticleItem(this.article, {super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    String? img = article["urlToImage"];
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: cubit.selectedIndex == index
                ? Border.all(color: Colors.orangeAccent)
                : null,
          ),
          child: InkWell(
            onTap: () {
              if (Platform.isWindows) {
                cubit.selectBusinessItem(index);
              } else {
                navigateTo(
                  context,
                  WebViewScreen(
                    url: article["url"],
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: img == null
                          ? const DecorationImage(
                              image: AssetImage(
                                "assets/images/no_img.jpeg",
                              ),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: NetworkImage(
                                img,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "${article["title"]}",
                              style: Theme.of(context).textTheme.bodyLarge,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "${article["publishedAt"]}",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
