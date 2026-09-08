import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/features/projects/domain/entities/project.dart';
import 'package:portfolio/features/projects/domain/repositories/project_repository.dart';
import 'package:portfolio/features/projects/domain/usecases/get_projects.dart';

class MockProjectRepository extends Mock implements ProjectRepository {}

void main() {
  late GetProjects usecase;
  late MockProjectRepository mockRepository;

  setUp(() {
    mockRepository = MockProjectRepository();
    usecase = GetProjects(mockRepository);
  });

  const tProjects = [
    Project(
      id: '1',
      title: 'Test App',
      category: 'Flutter',
      description: 'Test Description',
      image: 'url',
      screenshots: [],
      technologies: ['Flutter'],
      platforms: ['Android'],
      role: 'Developer',
      problem: 'Problem',
      solution: 'Solution',
      features: [],
      architecture: 'Clean',
    )
  ];

  test('should get list of projects from the repository', () async {
    when(() => mockRepository.getProjects())
        .thenAnswer((_) async => const EitherResult(data: tProjects));

    final result = await usecase();

    expect(result.data, tProjects);
    verify(() => mockRepository.getProjects()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
