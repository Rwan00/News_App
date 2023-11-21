import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/state.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_rounded), label: "Business"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: "Science"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_outlined), label: "Sports"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: "Settings"),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportScreen(),
    const SettingScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "country": "eg",
        "category": "business",
        "apikey": "65f7f556ec76449fa7dc7c0069f040ca"
      },
    ).then((value) {
      business = value!.data["articles"];
      print(business[0]["title"]);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }
}
