import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/app/app_routes.dart';
import 'package:newsify/viewmodels/home_viewmodel.dart';
import 'package:newsify/widgets/feed_tab.dart';
import 'package:newsify/widgets/saved_tab.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeViewmodel);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Newsify",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.settings);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF5F5F5),
              ),
              child: Image.asset(
                "assets/images/settings.png",
                width: 20,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    FeedTab(),
                    SavedTab(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 1,
              color: Colors.grey[100],
            ),
            Row(
              children: [
                for (int i = 0; i < 2; i++)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref.read(homeViewmodel.notifier).changeIndex(i);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          "assets/images/${["home", "saved"][i]}.png",
                          height: 38,
                          color: selectedIndex == i
                              ? Colors.black
                              : Color(0xffA6A4A0),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
