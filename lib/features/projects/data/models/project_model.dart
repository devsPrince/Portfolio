import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.category,
    required super.description,
    required super.image,
    required super.screenshots,
    required super.technologies,
    required super.platforms,
    super.githubUrl,
    super.gitLabUrl,
    super.androidUrl,
    super.iosUrl,
    super.webUrl,
    super.featured,
    required super.role,
    required super.problem,
    required super.solution,
    required super.features,
    required super.architecture,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      screenshots: List<String>.from(json['screenshots'] ?? []),
      technologies: List<String>.from(json['technologies'] ?? []),
      platforms: List<String>.from(json['platforms'] ?? []),
      githubUrl: json['githubUrl'] as String?,
      gitLabUrl: json['gitLabUrl'] as String?,
      androidUrl: json['androidUrl'] as String?,
      iosUrl: json['iosUrl'] as String?,
      webUrl: json['webUrl'] as String?,
      featured: json['featured'] as bool? ?? false,
      role: json['role'] as String,
      problem: json['problem'] as String,
      solution: json['solution'] as String,
      features: List<String>.from(json['features'] ?? []),
      architecture: json['architecture'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'image': image,
      'screenshots': screenshots,
      'technologies': technologies,
      'platforms': platforms,
      'githubUrl': githubUrl,
      'gitLabUrl': gitLabUrl,
      'androidUrl': androidUrl,
      'iosUrl': iosUrl,
      'webUrl': webUrl,
      'featured': featured,
      'role': role,
      'problem': problem,
      'solution': solution,
      'features': features,
      'architecture': architecture,
    };
  }
}
