// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/controllers/stats_controller.dart';

class StatsPage extends GetView<StatsController> {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('Stats'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            key: const Key('StatsPage_CompletedTodos_ListTile'),
            leading: const Icon(Icons.check_rounded),
            title: const Text('Completed todos'),
            trailing: Obx(() => Text('${controller.completedTodos}')),
          ),
          ListTile(
            key: const Key('StatsPage_ActiveTodos_ListTile'),
            leading: const Icon(Icons.radio_button_unchecked_rounded),
            title: const Text('Active todos'),
            trailing: Obx(() => Text('${controller.activeTodos}')),
          ),
        ],
      ),
    );
  }
}
