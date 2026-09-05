import '../../../../core/constants/portfolio_data.dart';
import '../models/github_repository_model.dart';

abstract class GithubRemoteDataSource {
  Future<List<GithubRepositoryModel>> fetchRepositories();
}

class GithubRemoteDataSourceImpl implements GithubRemoteDataSource {
  @override
  Future<List<GithubRepositoryModel>> fetchRepositories() async {
    // Map from PortfolioData repositories cleanly
    return PortfolioData.repositories.map((r) {
      return GithubRepositoryModel(
        name: r.name,
        description: r.description,
        language: r.language,
        stars: r.stars,
        forks: r.forks,
        htmlUrl: r.htmlUrl,
      );
    }).toList();
  }
}
