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
      appBar: AppBar(
        title: Text("Newsify"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.settings);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: IndexedStack(
          index: selectedIndex,
          children: [
            FeedTab(),
            SavedTab(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          ref.read(homeViewmodel.notifier).changeIndex(index);
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Saved",
          ),
        ],
      ),
    );
  }
}
