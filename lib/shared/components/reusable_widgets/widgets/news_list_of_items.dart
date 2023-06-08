import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'news_item.dart';

class NewsListOfItems extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final listOfNews;
  const NewsListOfItems({super.key , this.listOfNews});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: listOfNews.isNotEmpty,
      builder: (context) {
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              return NewsItem(
                item: listOfNews[index],
              );
            }),
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black,
              );
            },
            itemCount: 10);
      },
      fallback: ((context) => Center(
            child: CircularProgressIndicator(
              color: myBlack,
            ),
          )),
    );
  }
}
