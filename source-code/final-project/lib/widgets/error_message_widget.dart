import 'package:flutter/material.dart';
import 'package:newsify/utils/error_handler.dart';

class ErrorMessageWidget extends StatelessWidget {
  final Object error;
  const ErrorMessageWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        ErrorHandler.getErrorMessage(error),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
        ),
      ),
    );
  }
}
