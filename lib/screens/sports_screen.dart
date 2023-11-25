
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit.dart';
import '../cubits/state.dart';

import '../widgets/build_list.dart';


class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var sportList = NewsCubit.get(context).sports;

        return BuildList(itemsList: sportList, isSearch: false,);
      },
    );
  }
}
