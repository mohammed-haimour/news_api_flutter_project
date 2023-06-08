import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/shared/components/reusable_widgets/constants/colors.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/news_cubit.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusinessNews(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        )
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: const ColorScheme(
                  brightness: Brightness.light,
                  primary: Colors.white,
                  onPrimary: Colors.white,
                  secondary: Colors.white,
                  onSecondary: Colors.white,
                  primaryContainer: Colors.white,
                  error: Colors.white,
                  onError: Colors.white,
                  background: Colors.white,
                  onBackground: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.white,
                ),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  backgroundColor: myRed,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: myRed,
                    enableFeedback: true,
                    selectedLabelStyle: const TextStyle(fontSize: 16),
                    selectedItemColor:
                        const Color.fromARGB(255, 255, 255, 255))),
            darkTheme: ThemeData(
                colorScheme: const ColorScheme(
                  brightness: Brightness.dark,
                  primary: Colors.black,
                  onPrimary: Colors.black,
                  secondary: Colors.black,
                  onSecondary: Colors.black,
                  primaryContainer: Colors.black,
                  error: Colors.black,
                  onError: Colors.black,
                  background: Colors.black,
                  onBackground: Colors.black,
                  surface: Colors.black,
                  onSurface: Colors.black,
                ),
                scaffoldBackgroundColor: myLowBlack,
                // colorScheme: const ColorScheme.dark(),
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: myLowBlack),
                  titleTextStyle: TextStyle(color: myLowBlack, fontSize: 20),
                  elevation: 0,
                  backgroundColor: myRed,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: myRed,
                    enableFeedback: true,
                    selectedLabelStyle: const TextStyle(fontSize: 16),
                    selectedItemColor: myLowBlack)),
            themeMode: AppCubit.get(context).currentTheme,
            home: const HomeLayOut(),
          );
        },
      ),
    );
  }
}
