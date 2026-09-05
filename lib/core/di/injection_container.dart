import 'package:get_it/get_it.dart';
import '../../features/contact/data/datasources/contact_remote_data_source.dart';
import '../../features/contact/data/repositories/contact_repository_impl.dart';
import '../../features/contact/domain/repositories/contact_repository.dart';
import '../../features/contact/domain/usecases/submit_contact.dart';
import '../../features/contact/presentation/bloc/contact_bloc.dart';
import '../../features/github/data/datasources/github_remote_data_source.dart';
import '../../features/github/data/repositories/github_repository_impl.dart';
import '../../features/github/domain/repositories/github_repository.dart';
import '../../features/github/domain/usecases/get_repositories.dart';
import '../../features/github/presentation/bloc/github_bloc.dart';
import '../../features/projects/data/datasources/project_remote_data_source.dart';
import '../../features/projects/data/repositories/project_repository_impl.dart';
import '../../features/projects/domain/repositories/project_repository.dart';
import '../../features/projects/domain/usecases/filter_projects.dart';
import '../../features/projects/domain/usecases/get_featured_projects.dart';
import '../../features/projects/domain/usecases/get_projects.dart';
import '../../features/projects/presentation/bloc/project_filter_cubit.dart';
import '../../features/projects/presentation/bloc/projects_bloc.dart';
import '../utils/url_launcher_utils.dart';

final sl = GetIt.instance;

void initDI() {
  // Core & Utils
  sl.registerLazySingleton<AppLinkLauncher>(() => AppLinkLauncherImpl());

  // Projects Feature
  sl.registerLazySingleton<ProjectRemoteDataSource>(() => ProjectRemoteDataSourceImpl());
  sl.registerLazySingleton<ProjectRepository>(() => ProjectRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetProjects(sl()));
  sl.registerLazySingleton(() => GetFeaturedProjects(sl()));
  sl.registerLazySingleton(() => FilterProjects(sl()));
  sl.registerFactory(() => ProjectsBloc(getProjects: sl(), filterProjects: sl()));
  sl.registerFactory(() => ProjectFilterCubit());

  // Contact Feature
  sl.registerLazySingleton<ContactRemoteDataSource>(() => ContactRemoteDataSourceImpl());
  sl.registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl(sl()));
  sl.registerLazySingleton(() => SubmitContact(sl()));
  sl.registerFactory(() => ContactBloc(submitContact: sl()));

  // GitHub Feature
  sl.registerLazySingleton<GithubRemoteDataSource>(() => GithubRemoteDataSourceImpl());
  sl.registerLazySingleton<GithubRepository>(() => GithubRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetRepositories(sl()));
  sl.registerFactory(() => GithubBloc(getRepositories: sl()));
}
