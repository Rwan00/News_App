import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/helpers/cache_helper.dart';

import 'app_cubit_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    }
else{
isDark = !isDark;
}
    
    CacheHelper.putData(key: "isDark", value: isDark)
        .then((value) => emit(AppChangeModeState()));
  }
}
