import 'package:flutter/material.dart';

import 'widgetexercice.dart';

class GridViewExercice extends StatelessWidget {
  const GridViewExercice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.redAccent.withAlpha(50),
          borderRadius: BorderRadius.circular(15)
        ),
        child: GridView.count(
          crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 15,
        children: [
          WidgetExercice(image: AssetImage("assets/images/pectoraux.png"),),
          WidgetExercice(image: AssetImage("assets/images/dos.png"),),
          WidgetExercice(image: AssetImage("assets/images/biceps.png"),),
          WidgetExercice(image: AssetImage("assets/images/jambe.png"),),
          WidgetExercice(image: AssetImage("assets/images/triceps.png"),),
          WidgetExercice(image: AssetImage("assets/images/abdos.png"),),
          WidgetExercice(image: AssetImage("assets/images/epaule.png"),),
        ],
    ),
      ),
    );
  }
}
