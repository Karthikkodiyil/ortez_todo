import 'package:flutter/material.dart';
import 'package:ortez_machine_test/utils/app_color.dart';
import 'package:ortez_machine_test/utils/app_style.dart';
import 'package:ortez_machine_test/utils/components/floating_action_button_widget.dart';
import 'package:ortez_machine_test/view/widgets/todo_tile_widget.dart';
import 'package:ortez_machine_test/view_model/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return Consumer<TodoViewmodel>(
      builder: (context, controller, child) => Scaffold(
        appBar: controller.isSearchBar
            ? AppBar(
                backgroundColor: kPrimColor,
                title: TextField(
                  onChanged: (value) {
                    controller.searchTodo(value);
                  },
                  maxLines: null,
                  autofocus: true,
                  controller: controller.searchController,
                  decoration: InputDecoration(
                      hintText: "Search ...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        controller.toggleSearchBar();
                      },
                      icon: const Icon(Icons.close))
                ],
              )
            : AppBar(
                centerTitle: true,
                backgroundColor: kPrimColor,
                title: Text(
                  "ORTEZ DEMO",
                  style: styles.blackSemi18,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        controller.toggleSearchBar();
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
        floatingActionButton: const FloatingActionButtonWidget(),
        body: const TodoTileWidget(),
      ),
    );
  }
}
