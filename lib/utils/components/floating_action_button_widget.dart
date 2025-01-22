import 'package:flutter/material.dart';
import 'package:ortez_machine_test/utils/app_color.dart';
import 'package:ortez_machine_test/view_model/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TodoViewmodel>(context, listen: false);
    return FloatingActionButton(
      onPressed: () {
        controller.addNewTodoNavigation(context);
      },
      backgroundColor: kPrimColor,
      child: const Icon(Icons.add),
    );
  }
}
