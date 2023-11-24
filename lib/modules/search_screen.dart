import 'package:flutter/material.dart';

import '../widgets/search_field.dart';

class SearchScreen extends StatelessWidget {

   const SearchScreen({super.key});



  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return  Scaffold(
      body: Column(
        children: [
          InputField(title: 'Search', hint: 'Search',controller: searchController,)
        ],
      ),
    );
  }
}
