import '../../../../core/error/failures.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';
import '../datasources/project_remote_data_source.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl(this.remoteDataSource);

  @override
  Future<EitherResult<List<Project>>> getProjects() async {
    try {
      final models = await remoteDataSource.getProjects();
      return EitherResult(data: models);
    } catch (e) {
      return EitherResult(failure: ServerFailure(e.toString()));
    }
  }

  @override
  Future<EitherResult<List<Project>>> getFeaturedProjects() async {
    try {
      final models = await remoteDataSource.getProjects();
      final featured = models.where((p) => p.featured).toList();
      return EitherResult(data: featured);
    } catch (e) {
      return EitherResult(failure: ServerFailure(e.toString()));
    }
  }

  @override
  Future<EitherResult<List<Project>>> filterProjects(String filter) async {
    try {
      final models = await remoteDataSource.getProjects();
      if (filter == "All") {
        return EitherResult(data: models);
      }
      final filtered = models.where((p) {
        if (filter == "Flutter") return p.technologies.contains("Flutter");
        if (filter == "FlutterFlow") return p.technologies.contains("FlutterFlow") || p.category.contains("FlutterFlow");
        if (filter == "Mobile") return p.platforms.contains("Android") || p.platforms.contains("iOS");
        if (filter == "Web") return p.platforms.contains("Web") || p.technologies.contains("Flutter Web");
        if (filter == "Desktop") return p.platforms.contains("macOS") || p.platforms.contains("Linux");
        if (filter == "Firebase") return p.technologies.contains("Firebase");
        return p.category.toLowerCase().contains(filter.toLowerCase());
      }).toList();
      return EitherResult(data: filtered);
    } catch (e) {
      return EitherResult(failure: ServerFailure(e.toString()));
    }
  }
}
