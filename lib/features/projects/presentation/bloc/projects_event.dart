import 'package:equatable/equatable.dart';

abstract class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object?> get props => [];
}

class LoadProjects extends ProjectsEvent {}

class FilterProjectsEvent extends ProjectsEvent {
  final String filter;

  const FilterProjectsEvent(this.filter);

  @override
  List<Object?> get props => [filter];
}

class RefreshProjects extends ProjectsEvent {}
