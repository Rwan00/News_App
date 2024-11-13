import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/cubit.dart';
import 'package:news_app/cubits/state.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widgets/build_list.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var businessList = NewsCubit.get(context).business;
        var cubit = NewsCubit.get(context);

        return ScreenTypeLayout.builder(
          mobile: (context) => BuildList(
            itemsList: businessList,
            isSearch: false,
          ),
          desktop: (context) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: BuildList(
                    itemsList: businessList,
                    isSearch: false,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        Text(
                          "Details",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "${businessList[cubit.selectedIndex]["description"]}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          breakpoints: const ScreenBreakpoints(
            desktop: 600,
            tablet: 600,
            watch: 100,
          ),
        );
      },
    );
  }
}
