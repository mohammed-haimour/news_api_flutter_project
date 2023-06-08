import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/reusable_widgets/widgets/news_list_of_items.dart';

import '../../shared/cubit/news_cubit.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List listOfNews = NewsCubit.get(context).searchNews;
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
              onChanged: (value) {
                NewsCubit.get(context).getSearchNews(value.toString());
              },
              controller: searchController,
              autocorrect: true,
              autofocus: true,
              decoration: const InputDecoration(
                  label: Text("Search"), suffixIcon: Icon(Icons.search)),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Search Must Not Be empty";
                } else {
                  // ignore: null_check_always_fails
                  return null!;
                }
              },
            ),
          ),
          body: NewsListOfItems(listOfNews: listOfNews),
        );
      },
    );
  }
}
