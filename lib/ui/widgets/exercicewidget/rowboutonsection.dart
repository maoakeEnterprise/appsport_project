import 'package:flutter/material.dart';

class RowButtonSectionWidget extends StatelessWidget {
  String? text;
  RowButtonSectionWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 111,
        decoration: BoxDecoration(
            color: Colors.cyanAccent.withAlpha(40),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text(text!,textAlign: TextAlign.center,),
      ),
      onTap: (){
      },
    );
  }
}
