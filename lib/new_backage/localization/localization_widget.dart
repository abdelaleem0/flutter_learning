import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationBody extends StatefulWidget {
  const LocalizationBody({Key? key}) : super(key: key);

  @override
  State<LocalizationBody> createState() => _LocalizationBodyState();
}

class _LocalizationBodyState extends State<LocalizationBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('title'.tr()),
        Text('hello'.tr()),

      ],
    );
  }
}
