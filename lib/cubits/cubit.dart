import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/state.dart';
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
}
