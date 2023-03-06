import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'createexercice_event.dart';
part 'createexercice_state.dart';

class CreateExerciceBloc extends Bloc<CreateExerciceEvent, CreateExerciceState> {
  CreateExerciceBloc() : super(CreateExerciceInitial()) {
    on<CreateExerciceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
