import 'package:equatable/equatable.dart';
import '../../domain/entities/project.dart';

abstract class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object?> get props => [];
}

class ProjectsInitial extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  final List<Project> projects;
  final String activeFilter;

  const ProjectsLoaded(this.projects, {this.activeFilter = "All"});

  @override
  List<Object?> get props => [projects, activeFilter];
}

class ProjectsEmpty extends ProjectsState {}

class ProjectsError extends ProjectsState {
  final String message;

  const ProjectsError(this.message);

  @override
  List<Object?> get props => [message];
}
