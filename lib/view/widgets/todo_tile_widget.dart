import 'package:flutter/material.dart';
import 'package:ortez_machine_test/utils/app_color.dart';
import 'package:ortez_machine_test/utils/app_style.dart';
import 'package:ortez_machine_test/utils/assets.gen.dart';
import 'package:ortez_machine_test/view_model/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return Consumer<TodoViewmodel>(
        builder: (context, controller, child) => ListView.builder(
            itemCount: controller.serchList.length,
            itemBuilder: (context, index) {
              final list = controller.serchList;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    controller.detailsNavigation(context, list[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: kBlack),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: SizedBox(
                          height: 35,
                          child: Image.asset(Assets.icons.todoIcon.path)),
                      title: Text(
                        list[index].title,
                        style: styles.blackRegular14,
                      ),
                      trailing: Checkbox(
                          activeColor: kBlack,
                          checkColor: kPrimColor,
                          value: list[index].completed,
                          // ignore: avoid_types_as_parameter_names
                          onChanged: (bool) {
                            controller.toggleCheck(list[index]);
                          }),
                    ),
                  ),
                ),
              );
            }));
  }
}
