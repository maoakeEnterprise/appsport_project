import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciceFirebase extends StatelessWidget {
  ExerciceFirebase({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> informationExercice =
      FirebaseFirestore.instance.collection('Exercices').snapshots();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ExerciceBloc, ExerciceState>(
        builder: (context, state) {
          if (state is ExerciceSuccessState) {
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
                      if(data['type'] == state.type){
                        return ListTile(
                          title: Text(data['nom']),
                        );
                      }
                      else{
                        return const ListTile();
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
                      return ListTile(
                        title: Text(data['nom']),
                      );
                    }).toList(),
                  );
                });
          }

        },
      ),
    );
  }
}
