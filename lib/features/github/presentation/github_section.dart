import 'package:flutter/material.dart';
import '../../../core/animations/animated_reveal.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_heading.dart';

class GithubSection extends StatelessWidget {
  final bool isDark;

  const GithubSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context) || Responsive.isTablet(context);

    return AnimatedReveal(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 20 : 64,
          vertical: 60,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SectionHeading(
                        title: "Code & Open Source",
                        subtitle: "Public repositories, open-source packages, and architecture boilerplates.",
                        isDark: isDark,
                      ),
                    ),
                    if (!mobile) ...[
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: () => UrlLauncherUtil.launchURL(PortfolioData.githubUrl),
                        icon: const Icon(Icons.code, size: 16),
                        label: const Text("View GitHub Profile"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.cardBg,
                          foregroundColor: AppColors.primaryText,
                          side: const BorderSide(color: AppColors.border),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 40),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: mobile ? 1 : (Responsive.isTablet(context) ? 2 : 2),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.6,
                  ),
                  itemCount: PortfolioData.repositories.length,
                  itemBuilder: (context, index) {
                    final repo = PortfolioData.repositories[index];
                    return GlassCard(
                      isDark: isDark,
                      padding: const EdgeInsets.all(24),
                      onTap: () => UrlLauncherUtil.launchURL(repo.htmlUrl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.folder_outlined, size: 20, color: AppColors.accent),
                                      const SizedBox(width: 10),
                                      Text(
                                        repo.name,
                                        style: AppTextStyles.cardHeading(isDark).copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const Icon(Icons.open_in_new, size: 16, color: AppColors.secondaryText),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                repo.description,
                                style: AppTextStyles.body(isDark).copyWith(fontSize: 14),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(color: AppColors.secondaryAccent, shape: BoxShape.circle),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(repo.language, style: AppTextStyles.metadata(isDark)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star_border, size: 16, color: AppColors.secondaryText),
                                  const SizedBox(width: 4),
                                  Text("${repo.stars}", style: AppTextStyles.metadata(isDark)),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.fork_right, size: 16, color: AppColors.secondaryText),
                                  const SizedBox(width: 4),
                                  Text("${repo.forks}", style: AppTextStyles.metadata(isDark)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                if (mobile) ...[
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => UrlLauncherUtil.launchURL(PortfolioData.githubUrl),
                      icon: const Icon(Icons.code, size: 16),
                      label: const Text("View GitHub Profile"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cardBg,
                        foregroundColor: AppColors.primaryText,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
