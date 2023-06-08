import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/news_cubit.dart';

import '../../shared/components/reusable_widgets/widgets/news_list_of_items.dart';

class BusniessScreen extends StatelessWidget {
  const BusniessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List listOfNews = NewsCubit.get(context).businessNews;
        return NewsListOfItems(
          listOfNews: listOfNews,
        );
      },
    );
  }
}
