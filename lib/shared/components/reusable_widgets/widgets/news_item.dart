import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final item;
  const NewsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: (item['urlToImage'] != null)
                      ? Image.network(
                          "${item['urlToImage']}",
                          fit: BoxFit.cover,
                        )
                      : const Center(
                          child: Text(
                          "No Image",
                          style: TextStyle(fontSize: 20),
                        )),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.all(5),
                          child: Text(
                            "${item['title']}",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.all(5),
                        child: Text(
                          "${item['publishedAt']}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
