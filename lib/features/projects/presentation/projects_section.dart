import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/animations/animated_reveal.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_heading.dart';
import '../bloc/projects_cubit.dart';
import 'case_study_modal.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDark;

  const ProjectsSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context) || Responsive.isTablet(context);
    final filters = [
      "All",
      "Flutter",
      "FlutterFlow",
      // "Mobile",
      // "Web",
      // "Desktop",
      // "Firebase",
      // "Freelance",
    ];

    return BlocProvider(
      create: (_) => ProjectsCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.watch<ProjectsCubit>();
          final state = cubit.state;

          return AnimatedReveal(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: mobile ? 20 : 64,
                vertical: mobile ? 20 : 36,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1300),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeading(
                        title: "Selected Projects",
                        subtitle: "Real products, applications and architectures I've designed and developed.",
                        isDark: isDark,
                      ),
                      const SizedBox(height: 20),

                      // Filter Chips (Animated Navbar Style)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: filters.map((filter) {
                            final isSelected = state.selectedFilter == filter;
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => cubit.filterProjects(filter),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isSelected ? AppColors.accent.withValues(alpha: 0.2) : (isDark ? AppColors.cardBg : AppColors.lightCardBg),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: isSelected ? AppColors.accent : (isDark ? AppColors.border : AppColors.lightBorder),
                                        width: isSelected ? 1.5 : 1,
                                      ),
                                      boxShadow: isSelected
                                          ? [
                                              BoxShadow(
                                                color: AppColors.accent.withValues(alpha: 0.25),
                                                blurRadius: 12,
                                                spreadRadius: 1,
                                              ),
                                            ]
                                          : [],
                                    ),
                                    child: Text(
                                      filter,
                                      style: TextStyle(
                                        fontFamily: 'sans-serif',
                                        fontSize: 14,
                                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                                        color: isSelected
                                            ? AppColors.accent
                                            : (isDark ? AppColors.primaryText : AppColors.lightPrimaryText),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Projects Grid / Showcase
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.filteredProjects.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 32),
                        itemBuilder: (context, index) {
                          final project = state.filteredProjects[index];
                          return _ProjectCard(
                            project: project,
                            isDark: isDark,
                            onCaseStudy: () {
                              showDialog(
                                context: context,
                                builder: (_) => CaseStudyModal(project: project, isDark: isDark),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final bool isDark;
  final VoidCallback onCaseStudy;

  const _ProjectCard({
    required this.project,
    required this.isDark,
    required this.onCaseStudy,
  });

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context) || Responsive.isTablet(context);

    return GlassCard(
      isDark: isDark,
      padding: EdgeInsets.all(mobile ? 20 : 32),
      child: Flex(
        direction: mobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Screenshot Mockup
          Expanded(
            flex: mobile ? 0 : 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                project.image,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 260,
                  color: AppColors.primaryBg,
                  child: const Center(child: Icon(Icons.image, size: 50, color: AppColors.secondaryText)),
                ),
              ),
            ),
          ),
          if (mobile) const SizedBox(height: 24),
          if (!mobile) const SizedBox(width: 32),

          // Right: Info & Links
          Expanded(
            flex: mobile ? 0 : 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        project.category,
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                    if (project.featured)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "Featured Project",
                          style: TextStyle(
                            fontFamily: 'sans-serif',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.success,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  project.title,
                  style: AppTextStyles.cardHeading(isDark).copyWith(fontSize: 24),
                ),
                const SizedBox(height: 12),
                Text(
                  project.description,
                  style: AppTextStyles.body(isDark),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.technologies.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.primaryBg : AppColors.lightSecondaryBg,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        tech,
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondaryAccent,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),

                // Platform Action Buttons
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: onCaseStudy,
                      icon: const Icon(Icons.article_outlined, size: 16),
                      label: const Text("Case Study"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    if ((project.gitLabUrl != null && !project.gitLabUrl!.contains("[")) ||
                        (project.githubUrl != null && !project.githubUrl!.contains("[")))
                      OutlinedButton.icon(
                        onPressed: () => UrlLauncherUtil.launchURL(project.gitLabUrl ?? project.githubUrl!),
                        icon: const Icon(Icons.code, size: 16),
                        label: const Text("GitLab"),
                        style: OutlinedButton.styleFrom(foregroundColor: isDark ? AppColors.primaryText : AppColors.lightPrimaryText),
                      ),
                    if (project.androidUrl != null && !project.androidUrl!.contains("["))
                      ElevatedButton.icon(
                        onPressed: () => UrlLauncherUtil.launchURL(project.androidUrl!),
                        icon: const Icon(Icons.android, size: 16),
                        label: const Text("Google Play"),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.success, foregroundColor: Colors.white),
                      ),
                    if (project.iosUrl != null && !project.iosUrl!.contains("["))
                      ElevatedButton.icon(
                        onPressed: () => UrlLauncherUtil.launchURL(project.iosUrl!),
                        icon: const Icon(Icons.apple, size: 16),
                        label: const Text("App Store"),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryText, foregroundColor: AppColors.primaryBg),
                      ),
                    if (project.webUrl != null && !project.webUrl!.contains("["))
                      ElevatedButton.icon(
                        onPressed: () => UrlLauncherUtil.launchURL(project.webUrl!),
                        icon: const Icon(Icons.open_in_new, size: 16),
                        label: const Text("Live Demo"),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryAccent, foregroundColor: Colors.black),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
