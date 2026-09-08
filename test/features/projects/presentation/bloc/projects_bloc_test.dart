import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/projects/domain/entities/project.dart';
import 'package:portfolio/features/projects/domain/repositories/project_repository.dart';
import 'package:portfolio/features/projects/domain/usecases/filter_projects.dart';
import 'package:portfolio/features/projects/domain/usecases/get_projects.dart';
import 'package:portfolio/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:portfolio/features/projects/presentation/bloc/projects_event.dart';
import 'package:portfolio/features/projects/presentation/bloc/projects_state.dart';

class MockProjectRepository extends Mock implements ProjectRepository {}

void main() {
  late ProjectsBloc bloc;
  late GetProjects getProjects;
  late FilterProjects filterProjects;
  late MockProjectRepository mockRepository;

  setUp(() {
    mockRepository = MockProjectRepository();
    getProjects = GetProjects(mockRepository);
    filterProjects = FilterProjects(mockRepository);
    bloc = ProjectsBloc(getProjects: getProjects, filterProjects: filterProjects);
  });

  tearDown(() {
    bloc.close();
  });

  const tProjects = [
    Project(
      id: '1',
      title: 'Test App',
      category: 'Flutter',
      description: 'Test Desc',
      image: 'url',
      screenshots: [],
      technologies: ['Flutter'],
      platforms: ['Android'],
      role: 'Dev',
      problem: 'Prob',
      solution: 'Sol',
      features: [],
      architecture: 'Clean',
    )
  ];

  test('initial state should be ProjectsInitial', () {
    expect(bloc.state, ProjectsInitial());
  });

  test('emits [ProjectsLoading, ProjectsLoaded] when LoadProjects is successful', () async {
    when(() => mockRepository.getProjects()).thenAnswer((_) async => const EitherResult(data: tProjects));

    final expected = [
      ProjectsLoading(),
      const ProjectsLoaded(tProjects),
    ];

    expectLater(bloc.stream, emitsInOrder(expected));

    bloc.add(LoadProjects());
  });

  test('emits [ProjectsLoading, ProjectsError] when LoadProjects fails', () async {
    when(() => mockRepository.getProjects()).thenAnswer((_) async => const EitherResult(failure: ServerFailure('Error')));

    final expected = [
      ProjectsLoading(),
      const ProjectsError('Error'),
    ];

    expectLater(bloc.stream, emitsInOrder(expected));

    bloc.add(LoadProjects());
  });
}
