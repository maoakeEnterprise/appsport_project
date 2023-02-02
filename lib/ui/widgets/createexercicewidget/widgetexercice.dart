import 'package:flutter/material.dart';

class WidgetExercice extends StatelessWidget {
  AssetImage? image;
  WidgetExercice({Key? key,this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Image(image: image!,),

      ),
      onTap: (){},
    );
  }
}
