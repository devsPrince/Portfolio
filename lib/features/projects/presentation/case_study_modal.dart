import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/url_launcher_util.dart';

class CaseStudyModal extends StatelessWidget {
  final ProjectModel project;
  final bool isDark;

  const CaseStudyModal({super.key, required this.project, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: size.width > 900 ? size.width * 0.15 : 16,
        vertical: 24,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.secondaryBg : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? AppColors.border : AppColors.lightBorder,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.cardBg : AppColors.lightCardBg,
                  border: Border(
                    bottom: BorderSide(
                      color: isDark ? AppColors.border : AppColors.lightBorder,
                    ),
                  ),
                ),
                child: Row(
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
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        project.title,
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              // Body content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Featured Image banner
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          project.image,
                          height: 280,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            height: 280,
                            color: AppColors.cardBg,
                            child: const Center(child: Icon(Icons.image, size: 50, color: AppColors.secondaryText)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Role & Platforms
                      Row(
                        children: [
                          Icon(Icons.person_outline, size: 18, color: AppColors.accent),
                          const SizedBox(width: 8),
                          Text(
                            "Role: ${project.role}",
                            style: AppTextStyles.body(isDark).copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: project.platforms.map((platform) {
                          return Chip(
                            label: Text(platform),
                            backgroundColor: AppColors.secondaryAccent.withValues(alpha: 0.1),
                            labelStyle: TextStyle(color: AppColors.secondaryAccent, fontSize: 12),
                            side: BorderSide.none,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),

                      // Overview
                      _buildSectionTitle("Project Overview", isDark),
                      const SizedBox(height: 8),
                      Text(project.description, style: AppTextStyles.body(isDark)),
                      const SizedBox(height: 24),

                      // Problem & Solution
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildInfoBox(
                              "The Challenge",
                              project.problem,
                              Icons.error_outline,
                              Colors.orange,
                              isDark,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildInfoBox(
                              "The Solution",
                              project.solution,
                              Icons.check_circle_outline,
                              AppColors.success,
                              isDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),

                      // Architecture Flow Visualization
                      _buildSectionTitle("Architecture & Clean Design Flow", isDark),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.cardBg : AppColors.lightCardBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: isDark ? AppColors.border : AppColors.lightBorder),
                        ),
                        child: Column(
                          children: [
                            Text(
                              project.architecture,
                              style: AppTextStyles.metadata(isDark).copyWith(fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            _buildArchitectureFlow("UI View", isDark),
                            _buildArrow(isDark),
                            _buildArchitectureFlow("BLoC / State Management", isDark),
                            _buildArrow(isDark),
                            _buildArchitectureFlow("Domain Use Case", isDark),
                            _buildArrow(isDark),
                            _buildArchitectureFlow("Repository Interface", isDark),
                            _buildArrow(isDark),
                            _buildArchitectureFlow("Remote Data Source (REST API / Firebase)", isDark),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Key Features
                      _buildSectionTitle("Key Features", isDark),
                      const SizedBox(height: 12),
                      ...project.features.map((feature) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.check, size: 18, color: AppColors.accent),
                                const SizedBox(width: 10),
                                Expanded(child: Text(feature, style: AppTextStyles.body(isDark))),
                              ],
                            ),
                          )),
                      const SizedBox(height: 28),

                      // Technology Stack
                      _buildSectionTitle("Technology Stack", isDark),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: project.technologies.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
                            ),
                            child: Text(
                              tech,
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.accent,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 36),

                      // Action Links
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if ((project.gitLabUrl != null && !project.gitLabUrl!.contains("[")) ||
                              (project.githubUrl != null && !project.githubUrl!.contains("[")))
                            ElevatedButton.icon(
                              onPressed: () => UrlLauncherUtil.launchURL(project.gitLabUrl ?? project.githubUrl!),
                              icon: const Icon(Icons.code, size: 18),
                              label: const Text("View GitLab Repository"),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.cardBg, foregroundColor: AppColors.primaryText),
                            ),
                          if (project.androidUrl != null && !project.androidUrl!.contains("[")) ...[
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              onPressed: () => UrlLauncherUtil.launchURL(project.androidUrl!),
                              icon: const Icon(Icons.android, size: 18),
                              label: const Text("Google Play"),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.success, foregroundColor: Colors.white),
                            ),
                          ],
                          if (project.iosUrl != null && !project.iosUrl!.contains("[")) ...[
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              onPressed: () => UrlLauncherUtil.launchURL(project.iosUrl!),
                              icon: const Icon(Icons.apple, size: 18),
                              label: const Text("App Store"),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryText, foregroundColor: AppColors.primaryBg),
                            ),
                          ],
                          if (project.webUrl != null && !project.webUrl!.contains("[")) ...[
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              onPressed: () => UrlLauncherUtil.launchURL(project.webUrl!),
                              icon: const Icon(Icons.open_in_new, size: 18),
                              label: const Text("Live Demo"),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, foregroundColor: Colors.white),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'sans-serif',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
      ),
    );
  }

  Widget _buildInfoBox(String title, String content, IconData icon, Color color, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardBg : AppColors.lightCardBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'sans-serif',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: AppTextStyles.body(isDark).copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildArchitectureFlow(String text, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.secondaryBg : AppColors.lightSecondaryBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'sans-serif',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.accent,
        ),
      ),
    );
  }

  Widget _buildArrow(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Icon(Icons.arrow_downward, size: 16, color: AppColors.secondaryText),
    );
  }
}
