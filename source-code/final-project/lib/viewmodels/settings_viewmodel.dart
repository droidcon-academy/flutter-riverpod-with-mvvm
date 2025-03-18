import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/repositories/hive_repository.dart';

final settingsViewmodel = NotifierProvider<SettingsViewmodel, List<String>>(
  SettingsViewmodel.new,
);

class SettingsViewmodel extends Notifier<List<String>> {
  late final HiveRepository hiveRepository;

  @override
  List<String> build() {
    hiveRepository = ref.read(hiveRespositoryProvider);
    return hiveRepository.getCategories();
  }

  void updateCategories(List<String> categories) {
    hiveRepository.setCategories(categories);
    state = categories;
  }
}
