import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class TextFiledNameExercice extends StatelessWidget {
  const TextFiledNameExercice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(40),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextField(
        decoration: CustomThemes.textFieldStyle,
      ),
    );
  }
}
