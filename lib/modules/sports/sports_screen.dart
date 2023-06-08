import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/reusable_widgets/widgets/news_list_of_items.dart';
import '../../shared/cubit/news_cubit.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List listOfNews = NewsCubit.get(context).sportsNews;
        return NewsListOfItems(
          listOfNews: listOfNews,
        );
      },
    );
  }
}
