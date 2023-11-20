import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/cubit.dart';
import 'package:news_app/cubits/state.dart';
import 'package:news_app/network/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit(),
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
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  DioHelper.getData(
                    url: "v2/top-headlines",
                    query: {
                      "country": "eg",
                      "category": "business",
                      "apikey": "65f7f556ec76449fa7dc7c0069f040ca"
                    },
                  ).then((value) {
                    print(value!.data.toString());
                  }).catchError((error) {
                    print(error.toString());
                  });
                },
                child: const Icon(Icons.add),
              ),
            );
          },
        ));
  }
}
