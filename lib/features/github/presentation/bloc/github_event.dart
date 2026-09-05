import 'package:equatable/equatable.dart';

abstract class GithubEvent extends Equatable {
  const GithubEvent();

  @override
  List<Object?> get props => [];
}

class LoadGithubRepositories extends GithubEvent {}
