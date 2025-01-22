import 'package:flutter/material.dart';
import 'package:ortez_machine_test/view/home_view.dart';
import 'package:ortez_machine_test/view/splash_screen_view.dart';
import 'package:ortez_machine_test/view_model/todo_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TodoViewmodel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(),
    );
  }
}
