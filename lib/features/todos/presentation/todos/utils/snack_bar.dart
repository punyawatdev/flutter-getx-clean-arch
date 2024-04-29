// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class SnackBarMessenger extends ScaffoldMessengerState {
  void showDeletedMessage({required String message, VoidCallback? undo}) {
    final context = Get.key.currentState?.context;
    if (context != null && !context.mounted) return;
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          ScaffoldMessenger.of(context!).hideCurrentSnackBar();
          undo?.call();
        },
      ),
    );

    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }
}
