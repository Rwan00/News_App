import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/state.dart';
import 'package:news_app/helpers/dio_helper.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
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
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getScience();
    }
    if (index == 2) {
      getSports();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  int selectedIndex = 0;

  void selectBusinessItem(index) {
    selectedIndex = index;
    emit(SelectBusinessItemState());
  }

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    if (business.isEmpty) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country": "us",
          "category": "business",
          "apikey": "56906d2f18e54b34a25a29a9dd93f8a6"
        },
      ).then((value) {
        business = value!.data["articles"];
       
        print(business[0]["publishedAt"]);

        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
      //print("Date = ${business[0]["date"]}");
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());

    if (science.isEmpty) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country": "us",
          "category": "science",
          "apikey": "56906d2f18e54b34a25a29a9dd93f8a6"
        },
      ).then((value) {
        science = value!.data["articles"];
        print(science[0]["publishedAt"]);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country": "us",
          "category": "sport",
          "apikey": "56906d2f18e54b34a25a29a9dd93f8a6"
        },
      ).then((value) {
        sports = value!.data["articles"];
        print(sports[0]["publishedAt"]);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];

    DioHelper.getData(
      url: "v2/everything",
      query: {"q": value, "apikey": "56906d2f18e54b34a25a29a9dd93f8a6"},
    ).then((value) {
      search = value!.data["articles"];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
