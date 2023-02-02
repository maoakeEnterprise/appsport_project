import 'package:flutter/material.dart';
import '../widgets/exercicewidget/casewidgetexercice.dart';
import '../widgets/exercicewidget/rowboutonsection.dart';
import '../widgets/exercicewidget/searchsection.dart';

class ExercicesPage extends StatelessWidget {
  const ExercicesPage({Key? key}) : super(key: key);

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
                RowButtonSectionWidget(text: "Haut du corps",),
                RowButtonSectionWidget(text: "Bras",),
                RowButtonSectionWidget(text: "Bas du Corps",),
              ],
        ),
      ),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
                itemBuilder: (context,index){
                return CaseWidgetExercice(cas: 1,image: const AssetImage("assets/images/muscle.png"),);
                }
            )
          )
        ],
      )
    );

  }
}
