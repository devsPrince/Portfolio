import '../../../../core/error/failures.dart';
import '../entities/github_repository_entity.dart';

abstract class GithubRepository {
  Future<EitherResult<List<GithubRepositoryEntity>>> getRepositories();
}

class EitherResult<T> {
  final T? data;
  final Failure? failure;
  const EitherResult({this.data, this.failure});
  bool get isSuccess => failure == null;
}
