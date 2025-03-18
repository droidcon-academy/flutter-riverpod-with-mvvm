import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/app/app_constants.dart';
import 'package:newsify/providers/news_provider.dart';
import 'package:newsify/repositories/hive_repository.dart';
import 'package:newsify/utils/extensions.dart';
import 'package:newsify/viewmodels/settings_viewmodel.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.invalidate(settingsViewmodel);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCategories = ref.watch(settingsViewmodel);
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: availableCategories.length,
                itemBuilder: (context, index) {
                  final category = availableCategories[index];
                  final isSelected = selectedCategories.contains(category);
                  return ListTile(
                    title: Text(category.capitalize()),
                    trailing: isSelected
                        ? Icon(Icons.check_box)
                        : Icon(Icons.check_box_outline_blank),
                    onTap: () {
                      final newCategories = [...selectedCategories];
                      if (isSelected) {
                        newCategories.remove(category);
                      } else {
                        newCategories.add(category);
                      }
                      ref
                          .read(settingsViewmodel.notifier)
                          .updateCategories(newCategories);
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: selectedCategories.isEmpty
                  ? null
                  : () {
                      final hiveRepository = ref.read(hiveRespositoryProvider);
                      hiveRepository.setCategories(selectedCategories);
                      ref.invalidate(newsProvider);
                      Navigator.pop(context);
                    },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
