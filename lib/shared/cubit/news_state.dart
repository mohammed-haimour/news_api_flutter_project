part of 'news_cubit.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsBottomNavigationBarChangesIndexState extends NewsState {}

class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsBusinessErrorState extends NewsState {
  final String err;
  NewsBusinessErrorState(this.err);
}

class NewsGetSportLoadingState extends NewsState {}

class NewsGetSportSuccessState extends NewsState {}

class NewsSportErrorState extends NewsState {
  final String err;
  NewsSportErrorState(this.err);
}

class NewsGetScinesLoadingState extends NewsState {}

class NewsGetScinesSuccessState extends NewsState {}

class NewsScinesErrorState extends NewsState {
  final String err;
  NewsScinesErrorState(this.err);
}


class NewsGetSearchLoadingState extends NewsState {}

class NewsGetSearchSuccessState extends NewsState {}

class NewsSearchErrorState extends NewsState {
  final String err;
  NewsSearchErrorState(this.err);
}
