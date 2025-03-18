import 'package:hive/hive.dart';

part 'user_preferences_model.g.dart';

@HiveType(typeId: 1)
class UserPreferences extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final List<String> categories;

  @HiveField(2)
  final String country;

  UserPreferences({
    this.id,
    required this.categories,
    this.country = 'us',
  });
}
