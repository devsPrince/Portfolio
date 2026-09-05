import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfoli/core/error/failures.dart';
import 'package:portfoli/features/projects/domain/entities/project.dart';
import 'package:portfoli/features/projects/domain/repositories/project_repository.dart';
import 'package:portfoli/features/projects/domain/usecases/filter_projects.dart';
import 'package:portfoli/features/projects/domain/usecases/get_projects.dart';
import 'package:portfoli/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:portfoli/features/projects/presentation/bloc/projects_event.dart';
import 'package:portfoli/features/projects/presentation/bloc/projects_state.dart';

class MockGetProjects extends Mock implements GetProjects {}
class MockFilterProjects extends Mock implements FilterProjects {}

void main() {
  late ProjectsBloc bloc;
  late MockGetProjects mockGetProjects;
  late MockFilterProjects mockFilterProjects;

  setUp(() {
    mockGetProjects = MockGetProjects();
    mockFilterProjects = MockFilterProjects();
    bloc = ProjectsBloc(getProjects: mockGetProjects, filterProjects: mockFilterProjects);
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
    when(() => mockGetProjects()).thenAnswer((_) async => const EitherResult(data: tProjects));

    final expected = [
      ProjectsLoading(),
      const ProjectsLoaded(tProjects),
    ];

    expectLater(bloc.stream, emitsInOrder(expected));

    bloc.add(LoadProjects());
  });

  test('emits [ProjectsLoading, ProjectsError] when LoadProjects fails', () async {
    when(() => mockGetProjects()).thenAnswer((_) async => const EitherResult(failure: ServerFailure('Error')));

    final expected = [
      ProjectsLoading(),
      const ProjectsError('Error'),
    ];

    expectLater(bloc.stream, emitsInOrder(expected));

    bloc.add(LoadProjects());
  });
}
