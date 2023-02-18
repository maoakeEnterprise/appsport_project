import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
import 'package:appsport_project/firebase/queryService.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciceFirebase extends StatelessWidget {
  ExerciceFirebase({Key? key}) : super(key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> informationExercice = FirebaseFirestore.instance.collection('Exercices').snapshots();
  bool flag = false;
  var listExo = [];
  var stateActual;


  

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
                      if(state.type != stateActual) {
                        print("test");
                        listExo = [];
                        QueryService().getQueryMuscle("${state.type}").then(
                          (QuerySnapshot docs){
                            if(docs.docs.isNotEmpty){
                              //listExo = [];
                              for(int i=0;i < docs.size ; i++){
                                if(data['idmuscle'] == docs.docs[i].get('id')){
                                  flag = true;
                                  listExo.add(data['idmuscle']);
                                  print(data['nom']);
                                }
                              }
                            }
                            stateActual = state.type;
                          }
                      );
                      }
                      if(listExo != null){
                        return ListTile(
                          title: Text("${listExo.length}"),
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
