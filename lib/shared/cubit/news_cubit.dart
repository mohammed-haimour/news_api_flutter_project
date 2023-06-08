import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/sciens/sciens_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

import '../network/remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_rounded), label: "Business"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_rounded), label: "Science"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball_rounded), label: "Sport"),
  ];

  final List<Widget> screens = [
    const BusniessScreen(),
    const SciensScreen(),
    const SportsScreen(),
  ];

  changeBottomNavBarIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getscienceNews();
    } else if (index == 2) {
      getSportsNews();
    }
    emit(NewsBottomNavigationBarChangesIndexState());
  }

  List<dynamic> businessNews = [];

  getBusinessNews() {
    emit(NewsGetBusinessLoadingState());
    DioHelper().getData(url: "v2/top-headlines", querey: {
      'country': 'us',
      'category': 'business',
      'apiKey': '683f52161a4b42ec97038a56e0afa3bc'
    }).then((value) {
      businessNews = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((err) {
      // ignore: unnecessary_brace_in_string_interps, avoid_print
      print("${err}");
      emit(NewsBusinessErrorState("somthing wen't wrong"));
    });
  }

  List<dynamic> sportsNews = [];

  getSportsNews() {
    emit(NewsGetSportLoadingState());

    if (sportsNews.isEmpty) {
      DioHelper().getData(url: "v2/top-headlines", querey: {
        'country': 'us',
        'category': 'sport',
        'apiKey': '683f52161a4b42ec97038a56e0afa3bc'
      }).then((value) {
        sportsNews = value.data['articles'];
        emit(NewsGetSportSuccessState());
      }).catchError((err) {
        // ignore: unnecessary_brace_in_string_interps, avoid_print
        print("${err}");
        emit(NewsSportErrorState("somthing wen't wrong"));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> scienceNews = [];

  getscienceNews() {
    emit(NewsGetScinesLoadingState());

    if (scienceNews.isEmpty) {
      DioHelper().getData(url: "v2/top-headlines", querey: {
        'country': 'us',
        'category': 'science',
        'apiKey': '683f52161a4b42ec97038a56e0afa3bc'
      }).then((value) {
        scienceNews = value.data['articles'];
        emit(NewsGetScinesSuccessState());
      }).catchError((err) {
        // ignore: unnecessary_brace_in_string_interps, avoid_print
        print("${err}");
        emit(NewsScinesErrorState("somthing wen't wrong"));
      });
    } else {
      emit(NewsGetScinesSuccessState());
    }
  }

  List<dynamic> searchNews = [];

  getSearchNews(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper().getData(url: "v2/everything", querey: {
      'q': value,
      'apiKey': '683f52161a4b42ec97038a56e0afa3bc'
    }).then((value) {
      searchNews = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((err) {
      // ignore: unnecessary_brace_in_string_interps, avoid_print
      print("${err}");
      emit(NewsSearchErrorState("somthing wen't wrong"));
    });
  }
}
