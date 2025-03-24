import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/app/app_constants.dart';
import 'package:newsify/app/app_routes.dart';
import 'package:newsify/repositories/hive_repository.dart';
import 'package:newsify/widgets/custom_list_tile.dart';

class CategorySelectionScreen extends ConsumerStatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  ConsumerState<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState
    extends ConsumerState<CategorySelectionScreen> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Select categories",
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
                      setState(
                        () {
                          if (isSelected) {
                            selectedCategories.remove(category);
                          } else {
                            selectedCategories.add(category);
                          }
                        },
                      );
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
                        Navigator.of(context).pushReplacementNamed(
                          AppRoutes.home,
                        );
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
