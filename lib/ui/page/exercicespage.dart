import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
import 'package:appsport_project/firebase/exercicefirebase.dart';
import 'package:appsport_project/model/exercice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/exercicewidget/casewidgetexercice.dart';
import '../widgets/exercicewidget/rowboutonsection.dart';
import '../widgets/exercicewidget/searchsection.dart';

class ExercicesPage extends StatelessWidget {
  ExercicesPage({Key? key}) : super(key: key);

  List<Exercice> exerciceList = [
    Exercice("Pompes","pectoraux"),
    Exercice("Curl Biceps", "muscle"),
    Exercice("Press", "jambe"),
    Exercice("Developper coucher", "pectoraux"),
    Exercice("Traction", "dos"),
    Exercice("Exercice Triceps", "triceps"),
    Exercice("Machine Abdos 1", "abdos"),
    Exercice("null", "null")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercices"),
        actions: [
          IconButton(onPressed: (){

          },
              icon: Image.asset("assets/images/engrenages.png",))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SearchSectionWidget(),
          Container(
            margin: const EdgeInsets.only(top: 10,left: 30,right: 30),
        //color: Colors.redAccent,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RowButtonSectionWidget(text: "Haut du corps",cas: 0,),
                RowButtonSectionWidget(text: "Bras",cas: 1,),
                RowButtonSectionWidget(text: "Bas du Corps",cas: 2,),
              ],
        ),
      ),
          const SizedBox(height: 10,),
          ExerciceFirebase()
          /*Expanded(
            child: ListView.builder(
              itemCount: exerciceList.length,
                itemBuilder: (context,index){
                if( index == exerciceList.length-1){
                  return CaseWidgetExercice(cas: 1);
                }
                else{
                  return CaseWidgetExercice(cas: 0,nomExercice: exerciceList[index].getNom,muscle: exerciceList[index].getMuscle,);
                }

                }
            )
          )*/
        ],
      )
    );

  }
}
