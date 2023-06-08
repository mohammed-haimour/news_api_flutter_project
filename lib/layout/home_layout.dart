import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import '../modules/search/search_screen.dart';
import '../shared/components/reusable_widgets/constants/colors.dart';
import '../shared/cubit/news_cubit.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var myCubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Latest News"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).chngeTheme();
                  },
                  icon: const Icon(Icons.brightness_4_rounded))
            ],
          ),
          body: myCubit.screens[myCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: myRed,
            currentIndex: myCubit.currentIndex,
            onTap: (index) {
              myCubit.changeBottomNavBarIndex(index);
            },
            items: myCubit.bottomItems,
          ),
        );
      },
    );
  }
}
