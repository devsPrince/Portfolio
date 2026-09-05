import 'package:equatable/equatable.dart';

class GithubRepositoryEntity extends Equatable {
  final String name;
  final String description;
  final String language;
  final int stars;
  final int forks;
  final String htmlUrl;

  const GithubRepositoryEntity({
    required this.name,
    required this.description,
    required this.language,
    required this.stars,
    required this.forks,
    required this.htmlUrl,
  });

  @override
  List<Object?> get props => [name, description, language, stars, forks, htmlUrl];
}
