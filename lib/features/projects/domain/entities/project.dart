import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String id;
  final String title;
  final String category;
  final String description;
  final String image;
  final List<String> screenshots;
  final List<String> technologies;
  final List<String> platforms;
  final String? githubUrl;
  final String? androidUrl;
  final String? iosUrl;
  final String? webUrl;
  final bool featured;
  final String role;
  final String problem;
  final String solution;
  final List<String> features;
  final String architecture;

  const Project({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.screenshots,
    required this.technologies,
    required this.platforms,
    this.githubUrl,
    this.androidUrl,
    this.iosUrl,
    this.webUrl,
    this.featured = false,
    required this.role,
    required this.problem,
    required this.solution,
    required this.features,
    required this.architecture,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        category,
        description,
        image,
        screenshots,
        technologies,
        platforms,
        githubUrl,
        androidUrl,
        iosUrl,
        webUrl,
        featured,
        role,
        problem,
        solution,
        features,
        architecture,
      ];
}
