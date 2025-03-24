import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/app/app_constants.dart';
import 'package:newsify/providers/news_provider.dart';
import 'package:newsify/repositories/hive_repository.dart';
import 'package:newsify/viewmodels/settings_viewmodel.dart';
import 'package:newsify/widgets/custom_list_tile.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Settings",
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: availableCategories.length,
                itemBuilder: (context, index) {
                  final category = availableCategories[index];
                  final isSelected = selectedCategories.contains(category);
                  return CustomListTile(
                    isSelected: isSelected,
                    text: category,
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
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: selectedCategories.isEmpty
                    ? null
                    : () {
                        final hiveRepository =
                            ref.read(hiveRespositoryProvider);
                        hiveRepository.setCategories(selectedCategories);
                        ref.invalidate(newsProvider);
                        Navigator.pop(context);
                      },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  backgroundColor: Colors.black,
                ),
                child: Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
