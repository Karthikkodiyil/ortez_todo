import 'package:flutter/material.dart';
import 'package:ortez_machine_test/utils/app_style.dart';
import 'package:ortez_machine_test/utils/size_config.dart';

class LabeledTextFeild extends StatelessWidget {
  const LabeledTextFeild({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$hintText :",
            style: styles.blackMedium14,
          ),
          5.kH,
          TextField(
            style: styles.blackRegular14,
            maxLines: null,
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
