import 'package:flutter/material.dart';
import 'package:ortez_machine_test/utils/app_color.dart';
import 'package:ortez_machine_test/utils/app_style.dart';
import 'package:ortez_machine_test/utils/size_config.dart';
import 'package:ortez_machine_test/view_model/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Status :",
            style: styles.blackMedium14,
          ),
          5.kH,
          Consumer<TodoViewmodel>(
            builder: (context, controller, child) => Container(
              height: 55,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  border: Border.all(color: kBlack),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Status ",
                      style: styles.blackRegular14,
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.toggleStatus(true);
                            },
                            child: Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  color:
                                      controller.isCompleted! ? kGreen : kWhite,
                                  border: Border.all(
                                      color: controller.isCompleted!
                                          ? kGreen
                                          : kBlack),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "Completed",
                                style: controller.isCompleted!
                                    ? styles.whiteRegular14
                                    : styles.blackRegular14,
                              )),
                            ),
                          ),
                          5.kW,
                          InkWell(
                            onTap: () {
                              controller.toggleStatus(false);
                            },
                            child: Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                  color:
                                      controller.isCompleted! ? kWhite : kRed,
                                  border: Border.all(
                                      color: controller.isCompleted!
                                          ? kBlack
                                          : kRed),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "Not Completed",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins',
                                    color: controller.isCompleted!
                                        ? kBlack
                                        : kWhite,
                                    height: 1),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
