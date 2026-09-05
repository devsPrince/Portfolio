import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectFilterCubit extends Cubit<String> {
  ProjectFilterCubit() : super("All");

  void setFilter(String filter) {
    emit(filter);
  }

  void reset() {
    emit("All");
  }
}
