import '../entities/project.dart';
import '../repositories/project_repository.dart';

class GetFeaturedProjects {
  final ProjectRepository repository;

  GetFeaturedProjects(this.repository);

  Future<EitherResult<List<Project>>> call() async {
    return await repository.getFeaturedProjects();
  }
}
