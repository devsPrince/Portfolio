import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/filter_projects.dart';
import 'projects_event.dart';
import 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetProjects getProjects;
  final FilterProjects filterProjects;

  ProjectsBloc({
    required this.getProjects,
    required this.filterProjects,
  }) : super(ProjectsInitial()) {
    on<LoadProjects>(_onLoadProjects);
    on<FilterProjectsEvent>(_onFilterProjects);
    on<RefreshProjects>(_onRefreshProjects);
  }

  Future<void> _onLoadProjects(LoadProjects event, Emitter<ProjectsState> emit) async {
    emit(ProjectsLoading());
    final result = await getProjects();
    if (result.isSuccess) {
      final projects = result.data ?? [];
      if (projects.isEmpty) {
        emit(ProjectsEmpty());
      } else {
        emit(ProjectsLoaded(projects));
      }
    } else {
      emit(ProjectsError(result.failure?.message ?? 'Failed to load projects'));
    }
  }

  Future<void> _onFilterProjects(FilterProjectsEvent event, Emitter<ProjectsState> emit) async {
    emit(ProjectsLoading());
    final result = await filterProjects(event.filter);
    if (result.isSuccess) {
      final projects = result.data ?? [];
      if (projects.isEmpty) {
        emit(ProjectsEmpty());
      } else {
        emit(ProjectsLoaded(projects, activeFilter: event.filter));
      }
    } else {
      emit(ProjectsError(result.failure?.message ?? 'Failed to filter projects'));
    }
  }

  Future<void> _onRefreshProjects(RefreshProjects event, Emitter<ProjectsState> emit) async {
    add(LoadProjects());
  }
}
