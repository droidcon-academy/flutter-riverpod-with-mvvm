import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/utils/extensions.dart';

class CustomListTile extends ConsumerWidget {
  const CustomListTile({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(text.capitalize()),
      trailing: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey[200]!,
            width: 2,
          ),
        ),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 15,
        ),
      ),
      onTap: onTap,
    );
  }
}
