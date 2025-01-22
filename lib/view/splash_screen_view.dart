import 'package:flutter/material.dart';
import 'package:ortez_machine_test/utils/app_color.dart';
import 'package:ortez_machine_test/utils/assets.gen.dart';
import 'package:ortez_machine_test/utils/size_config.dart';
import 'package:ortez_machine_test/view_model/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<TodoViewmodel>(context).homePageNavigation(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              50.kW,
              SizedBox(
                  height: 250,
                  child: Image.asset(Assets.images.todoSplash.path)),
            ],
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          70.kH
        ],
      )),
    );
  }
}
