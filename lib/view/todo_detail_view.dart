import 'package:flutter/material.dart';
import 'package:ortez_machine_test/utils/components/prim_button_widget.dart';
import 'package:ortez_machine_test/utils/size_config.dart';
import 'package:ortez_machine_test/view/widgets/labeled_textfeild_widget.dart';
import 'package:ortez_machine_test/view/widgets/status_widget.dart';
import 'package:ortez_machine_test/view_model/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class TodoDetailView extends StatelessWidget {
  const TodoDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Consumer<TodoViewmodel>(
            builder: (context, controller, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            controller.popFunction(context);
                          },
                          child: const Icon(Icons.arrow_back)),
                       PrimButtonWidget(
                        onPressed: () {
                          controller.savefunction(context);
                        },
                      )
                    ],
                  ),
                  25.kH,
                  LabeledTextFeild(
                      controller: controller.titleController,
                      hintText: "Title"),
                  20.kH,
                  LabeledTextFeild(
                      controller: controller.discController,
                      hintText: "Description"),
                  20.kH,
                  const StatusWidget()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
