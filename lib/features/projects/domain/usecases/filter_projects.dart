import '../entities/project.dart';
import '../repositories/project_repository.dart';

class FilterProjects {
  final ProjectRepository repository;

  FilterProjects(this.repository);

  Future<EitherResult<List<Project>>> call(String filter) async {
    return await repository.filterProjects(filter);
  }
}
