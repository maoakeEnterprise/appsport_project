import 'package:flutter/material.dart';

import '../../themes/themes.dart';

// ignore: must_be_immutable
class CaseWidgetExercice extends StatelessWidget {
  AssetImage? image;
  int? cas;
  CaseWidgetExercice({Key? key,this.image,this.cas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(cas == 1){
      return InkWell(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
            border: Border.all(
              color: Colors.cyan.withAlpha(50),
              width: 5,
            )
          ),
          child: Row(
            children: [
              const Image(image: AssetImage("assets/images/stylo.png"),width: 75,height: 75,),
              const SizedBox(width: 20,),
              Text("Add Exercice",style: CustomThemes.widgetName)
            ],
          ),
        ),
        onTap: ()=> Navigator.pushNamed(context, "nouveauexercice"),
      );
    }
    else{
      return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        height: 120,
        decoration: BoxDecoration(
            color: Colors.greenAccent.withAlpha(60),
            borderRadius: BorderRadius.circular(35)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nom Exercice",style: CustomThemes.widgetName,),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(5),
                    width: 60,
                    height: 36,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Image(image: AssetImage("assets/images/stylo.png"),),
                  ),
                  onTap: (){

                  }
                  ,
                )
              ],
            ),
            Expanded(
              child: Image(image: image!)
            )
          ],
        ),
      );
    }

  }
}
