import '../entities/github_repository_entity.dart';
import '../repositories/github_repository.dart';

class GetRepositories {
  final GithubRepository repository;

  GetRepositories(this.repository);

  Future<EitherResult<List<GithubRepositoryEntity>>> call() async {
    return await repository.getRepositories();
  }
}
