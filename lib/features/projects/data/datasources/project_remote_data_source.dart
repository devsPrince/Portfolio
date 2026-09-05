import '../../../../core/constants/portfolio_data.dart' hide ProjectModel;
import '../models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjects();
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    return PortfolioData.projects.map((p) {
      return ProjectModel(
        id: p.id,
        title: p.title,
        category: p.category,
        description: p.description,
        image: p.image,
        screenshots: p.screenshots,
        technologies: p.technologies,
        platforms: p.platforms,
        githubUrl: p.githubUrl,
        androidUrl: p.androidUrl,
        iosUrl: p.iosUrl,
        webUrl: p.webUrl,
        featured: p.featured,
        role: p.role,
        problem: p.problem,
        solution: p.solution,
        features: p.features,
        architecture: p.architecture,
      );
    }).toList();
  }
}
