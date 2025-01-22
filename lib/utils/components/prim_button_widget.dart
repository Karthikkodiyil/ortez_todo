import 'package:flutter/material.dart';
import 'package:ortez_machine_test/utils/app_color.dart';
import 'package:ortez_machine_test/utils/app_style.dart';
import 'package:ortez_machine_test/view_model/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class PrimButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  const PrimButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return Consumer<TodoViewmodel>(
      builder: (context, controller, child) {
        final todo = controller.selectedTodo!;
        return MaterialButton(
          onPressed: () {
            onPressed;
            controller.updateTodo(todo, context);
          },
          color: kPrimColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(
            "Save",
            style: styles.blackMedium15,
          ),
        );
      },
    );
  }
}
