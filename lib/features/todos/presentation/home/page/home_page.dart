// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/edit_todo/page/edit_todo_page.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/home/controllers/home_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/page/stats_page.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/page/todos_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomeController>(
        builder: (tab) {
          return IndexedStack(
            index: tab.pageIndex,
            children: const [
              TodosPage(),
              StatsPage(),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        key: const Key('HomePage_AddTodo_FloatingActionButton'),
        onPressed: () {
          Get.to(
            () => const EditTodoPage(),
            transition: Transition.downToUp,
            fullscreenDialog: true,
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: GetX<HomeController>(
        builder: (tab) => NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: tab.pageIndex,
          onDestinationSelected: (int index) => controller.setPage(index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.list),
              label: 'Todo List',
            ),
            NavigationDestination(
              icon: Icon(Icons.show_chart),
              label: 'Stats',
            ),
          ],
        ),
      ),
    );
  }
}
