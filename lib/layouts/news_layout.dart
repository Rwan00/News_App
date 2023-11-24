import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/cubit.dart';
import 'package:news_app/cubits/state.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusiness()..getScience()..getSports(),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text("News App"),
                actions: [
                  IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(
                      Icons.brightness_6_rounded,
                    ),
                  ),
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomItems,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            );
          },
        ));
  }
}
