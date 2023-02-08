import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exercice_event.dart';
part 'exercice_state.dart';

class ExerciceBloc extends Bloc<ExerciceEvent, ExerciceState> {
  ExerciceBloc() : super(ExerciceInitial()) {
    on<HautDuCorpsEvent>((event, emit) {
      // TODO: implement event handler
      print("Test Haut du corps Event");
    });
    on<BrasEvent>((event, emit) {
      // TODO: implement event handler
      print("Test Bras du corps Event");
    });
    on<BasDuCorpsEvent>((event, emit) {
      // TODO: implement event handler
      print("Test Bas du corps Event");
    });
  }
}
