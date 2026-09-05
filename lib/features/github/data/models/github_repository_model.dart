import '../../domain/entities/github_repository_entity.dart';

class GithubRepositoryModel extends GithubRepositoryEntity {
  const GithubRepositoryModel({
    required super.name,
    required super.description,
    required super.language,
    required super.stars,
    required super.forks,
    required super.htmlUrl,
  });

  factory GithubRepositoryModel.fromJson(Map<String, dynamic> json) {
    return GithubRepositoryModel(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      language: json['language'] as String? ?? 'Dart',
      stars: json['stargazers_count'] as int? ?? 0,
      forks: json['forks_count'] as int? ?? 0,
      htmlUrl: json['html_url'] as String? ?? '',
    );
  }
}
