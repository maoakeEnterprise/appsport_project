part of 'exercice_bloc.dart';

@immutable
abstract class ExerciceState {
  String? type;
  ExerciceState({this.type});
}

class ExerciceInitial extends ExerciceState {
  ExerciceInitial({type}):super(type: type);
}

class ExerciceLoadingState extends ExerciceState{
  ExerciceLoadingState({type}):super(type: type);
}

class ExerciceSuccessState extends ExerciceState{
  ExerciceSuccessState({type}):super(type: type);
}
class ExerciceErrorState extends ExerciceState{
  ExerciceErrorState({type}):super(type: type);
}
