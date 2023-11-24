import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/layouts/news_layout.dart';
import 'package:news_app/network/dio_helper.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.black)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.orangeAccent,
            elevation: 20),
             textTheme: const TextTheme(bodyLarge:TextStyle(fontSize: 18, fontWeight: FontWeight.w600) ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,primary: Colors.deepOrangeAccent),
        //useMaterial3: true,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 101, 100, 100),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.black,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.white)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 101, 100, 100),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.orangeAccent,
            elevation: 20),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,primary: Colors.deepOrangeAccent),
        textTheme: const TextTheme(bodyLarge:TextStyle(fontSize: 18, fontWeight: FontWeight.w600) )
        //useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const NewsLayout(),
    );
  }
}
