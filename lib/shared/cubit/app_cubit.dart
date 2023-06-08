// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  ThemeMode currentTheme = ThemeMode.dark;
  bool isDark = true;

  chngeTheme() {
    emit(AppChangedTheme());
    isDark = !isDark;
    if (isDark) {
      currentTheme = ThemeMode.dark;
    } else {
      currentTheme = ThemeMode.light;
    }
  }
}
