import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/cubits/app_cubit.dart';
import 'package:news_app/helpers/cache_helper.dart';
import 'package:news_app/helpers/dio_helper.dart';
import 'package:news_app/layouts/news_layout.dart';

import 'cubits/app_cubit_state.dart';
import 'cubits/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: "isDark");
  runApp( MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
   const MyApp( {this.isDark,super.key, });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getScience()..getSports()),
        BlocProvider(create:  (BuildContext context) => AppCubit()..changeAppMode(fromShared: isDark),),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  titleSpacing: 20,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.black)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.orangeAccent,
                  elevation: 20),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                bodySmall: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple,
                  primary: Colors.deepOrangeAccent),
              //useMaterial3: true,
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(255, 101, 100, 100),
              appBarTheme: const AppBarTheme(
                  titleSpacing: 20,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black,
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: Colors.black,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.white)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Color.fromARGB(255, 101, 100, 100),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.orangeAccent,
                  elevation: 20),
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple,
                  primary: Colors.deepOrangeAccent),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                bodySmall: TextStyle(color: Colors.white, fontSize: 15),
              ),
              //useMaterial3: true,
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
