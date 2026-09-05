import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/portfolio_data.dart';

class ProjectsState {
  final String selectedFilter;
  final int selectedIndex;
  final List<ProjectModel> filteredProjects;

  ProjectsState({
    required this.selectedFilter,
    required this.selectedIndex,
    required this.filteredProjects,
  });
}

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit()
      : super(ProjectsState(
          selectedFilter: "All",
          selectedIndex: 0,
          filteredProjects: PortfolioData.projects,
        ));

  void filterProjects(String filter) {
    List<ProjectModel> filtered;
    if (filter == "All") {
      filtered = PortfolioData.projects;
    } else {
      filtered = PortfolioData.projects.where((p) {
        if (filter == "Flutter") return p.technologies.contains("Flutter");
        if (filter == "FlutterFlow") return p.technologies.contains("FlutterFlow") || p.category.contains("FlutterFlow");
        if (filter == "Mobile") return p.platforms.contains("Android") || p.platforms.contains("iOS");
        if (filter == "Web") return p.platforms.contains("Web") || p.technologies.contains("Flutter Web");
        if (filter == "Desktop") return p.platforms.contains("macOS") || p.platforms.contains("Linux");
        if (filter == "Firebase") return p.technologies.contains("Firebase");
        if (filter == "Freelance") return true; // all freelance ready
        return p.category.toLowerCase().contains(filter.toLowerCase());
      }).toList();
    }

    emit(ProjectsState(
      selectedFilter: filter,
      selectedIndex: 0,
      filteredProjects: filtered.isEmpty ? PortfolioData.projects : filtered,
    ));
  }

  void selectIndex(int index) {
    emit(ProjectsState(
      selectedFilter: state.selectedFilter,
      selectedIndex: index,
      filteredProjects: state.filteredProjects,
    ));
  }
}
