import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit_state.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode()
  {
    isDark = !isDark;
    emit(AppChangeModeState());
  }
}