import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsify/app/app_routes.dart';
import 'package:newsify/hive/hive_boxes.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/models/user_preferences_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserPreferencesAdapter());
  Hive.registerAdapter(SourceAdapter());
  await Hive.openBox<UserPreferences>(HiveBoxes.categories);
  await Hive.openBox<Article>(HiveBoxes.savedArticles);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Newsify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
        fontFamily: "SFPro",
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
