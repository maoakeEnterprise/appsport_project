import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
import 'package:appsport_project/model/muscle.dart';
import 'package:appsport_project/ui/widgets/exercicewidget/casewidgetexercice.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ExerciceFirebase extends StatelessWidget {
  ExerciceFirebase({Key? key}) : super(key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;
  Stream<QuerySnapshot> informationExercice = FirebaseFirestore.instance.collection('Exercices').snapshots();
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ExerciceBloc, ExerciceState>(
        builder: (context, state) {
          if (state is ExerciceSuccessState) {
            informationExercice = FirebaseFirestore.instance.collection('Exercices').where('type',isEqualTo: state.type).snapshots();
            return StreamBuilder(
                stream: informationExercice,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("ERROR");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  return ListView(
                    children:
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                      print(state.valSearching);
                      if(state.type != null){
                        print(state.type);
                        return CaseWidgetExercice(nom: data['nom'],nomMuscle: data['nomMuscle'],);
                      }
                      else if(state.valSearching != null && data['nom'].toString().toLowerCase().startsWith(state.valSearching!.toLowerCase())){
                        return CaseWidgetExercice(nom: data['nom'],nomMuscle: data['nomMuscle'],);
                      }
                      else{
                        return Container();
                      }

                    }).toList(),
                  );
                });
          }
          else{
            return StreamBuilder(
                stream: informationExercice,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("ERROR");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  return ListView(
                    children:
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                      return CaseWidgetExercice(nom: data['nom'],nomMuscle: data['nomMuscle'],);
                    }).toList(),
                  );
                });
          }
        },
      ),
    );
  }

  Future<bool> muscleRecup(String idmuscle,String state) async{
    final ref = db.collection('Muscles').doc(idmuscle).withConverter(
      fromFirestore: Muscle.fromFirestore,
      toFirestore: (Muscle muscle, _) => muscle.toFirestore(),
    );
    final docSnap = await ref.get();
    final muscle = docSnap.data();

    flag = false;
    if(muscle == null) return false;
    if(muscle.type == state) flag = true;

    return false;

  }
}
