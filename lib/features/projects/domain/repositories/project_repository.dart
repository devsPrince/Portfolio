import '../../../../core/error/failures.dart';
import '../entities/project.dart';

abstract class ProjectRepository {
  Future<EitherResult<List<Project>>> getProjects();
  Future<EitherResult<List<Project>>> getFeaturedProjects();
  Future<EitherResult<List<Project>>> filterProjects(String filter);
}

class EitherResult<T> {
  final T? data;
  final Failure? failure;

  const EitherResult({this.data, this.failure});

  bool get isSuccess => failure == null;
}
