import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/cubit.dart';
import 'package:news_app/cubits/state.dart';

import '../widgets/article_item.dart';
import '../widgets/build_list.dart';
import '../widgets/search_field.dart';

class SearchScreen extends StatelessWidget {

   const SearchScreen({super.key});



  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return  BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
      builder: (context,state){

          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                const SizedBox(height: 10,),
                InputField(
                  title: 'Search',
                  hint: 'Search For..',
                  controller: searchController,
                  inputType: TextInputType.text,
                  validator: (String? value){
                    if(value!.isEmpty)
                    {
                      return "Search Must Not Be Empty!";
                    }
                    else
                    {
                      return null;
                    }
                  },
                  widget: const Icon(Icons.search),
                  onChanged:(value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
                Expanded(child: BuildList(itemsList: list)),
              ],
            ),
          );
      },
    );
  }


}



