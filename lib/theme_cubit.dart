import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_defaultTheme);

  static final ThemeData _defaultTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurple,
  );

  void changeTheme() {
    final newColor = Color(Random().nextInt(0xFFFFFF)).withOpacity(1.0);
    final newTheme = _defaultTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: newColor),
        scaffoldBackgroundColor: newColor);
    emit(newTheme);
  }
}
