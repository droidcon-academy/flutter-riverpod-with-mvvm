import 'package:flutter/material.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/views/article_details_screen.dart';
import 'package:newsify/views/category_selection_screen.dart';
import 'package:newsify/views/home_screen.dart';
import 'package:newsify/views/settings_screen.dart';

class AppRoutes {
  static const String categorySelection = '/categorySelection';
  static const String home = '/home';
  static const String articleDetails = '/articleDetails';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> routes = {
    categorySelection: (context) => CategorySelectionScreen(),
    home: (context) => HomeScreen(),
    articleDetails: (context) {
      final article = ModalRoute.of(context)!.settings.arguments as Article;
      return ArticleDetailsScreen(article: article);
    },
    settings: (context) => SettingsScreen(),
  };
}
