import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_repositories.dart';
import 'github_event.dart';
import 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final GetRepositories getRepositories;

  GithubBloc({required this.getRepositories}) : super(GithubInitial()) {
    on<LoadGithubRepositories>(_onLoadGithubRepositories);
  }

  Future<void> _onLoadGithubRepositories(LoadGithubRepositories event, Emitter<GithubState> emit) async {
    emit(GithubLoading());
    final result = await getRepositories();
    if (result.isSuccess) {
      final repos = result.data ?? [];
      if (repos.isEmpty) {
        emit(GithubEmpty());
      } else {
        emit(GithubLoaded(repos));
      }
    } else {
      emit(GithubError(result.failure?.message ?? 'Failed to load GitHub repositories'));
    }
  }
}
