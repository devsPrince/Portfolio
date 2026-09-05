import '../../../../core/error/failures.dart';
import '../../domain/entities/github_repository_entity.dart';
import '../../domain/repositories/github_repository.dart';
import '../datasources/github_remote_data_source.dart';

class GithubRepositoryImpl implements GithubRepository {
  final GithubRemoteDataSource remoteDataSource;

  GithubRepositoryImpl(this.remoteDataSource);

  @override
  Future<EitherResult<List<GithubRepositoryEntity>>> getRepositories() async {
    try {
      final models = await remoteDataSource.fetchRepositories();
      return EitherResult(data: models);
    } catch (e) {
      return EitherResult(failure: ServerFailure(e.toString()));
    }
  }
}
