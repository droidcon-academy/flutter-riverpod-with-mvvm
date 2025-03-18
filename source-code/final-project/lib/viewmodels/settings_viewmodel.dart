import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/repositories/hive_repository.dart';

final settingsViewmodel = NotifierProvider<SettingsViewmodel, List<String>>(
  SettingsViewmodel.new,
);

class SettingsViewmodel extends Notifier<List<String>> {
  @override
  List<String> build() {
    return ref.read(hiveRespositoryProvider).getCategories();
  }

  void updateCategories(List<String> categories) {
    state = categories;
  }
}
