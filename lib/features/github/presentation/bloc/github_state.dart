import 'package:equatable/equatable.dart';
import '../../domain/entities/github_repository_entity.dart';

abstract class GithubState extends Equatable {
  const GithubState();

  @override
  List<Object?> get props => [];
}

class GithubInitial extends GithubState {}

class GithubLoading extends GithubState {}

class GithubLoaded extends GithubState {
  final List<GithubRepositoryEntity> repositories;
  const GithubLoaded(this.repositories);

  @override
  List<Object?> get props => [repositories];
}

class GithubEmpty extends GithubState {}

class GithubError extends GithubState {
  final String message;
  const GithubError(this.message);

  @override
  List<Object?> get props => [message];
}
