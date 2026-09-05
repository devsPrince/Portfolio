import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_heading.dart';

class AboutSection extends StatelessWidget {
  final bool isDark;

  const AboutSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context) || Responsive.isTablet(context);

    return Container(
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
              SectionHeading(
                title: "About Me",
                subtitle: "Architecting high-performance applications with precision and scalability.",
                isDark: isDark,
              ),
              const SizedBox(height: 40),
              Flex(
                direction: mobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left: Detailed Bio & Approach
                  Expanded(
                    flex: mobile ? 0 : 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "I’m a Flutter developer focused on building scalable, maintainable and visually polished cross-platform applications. I work across mobile, web and desktop platforms and enjoy transforming product ideas into reliable production-ready software.",
                          style: AppTextStyles.body(isDark).copyWith(fontSize: 17, height: 1.7),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "With expertise in Clean Architecture, BLoC state management, and SOLID principles, I ensure every codebase is robust, modular, and easy to scale. Whether building complex enterprise financial applications or rapid FlutterFlow MVPs, I bridge the gap between design and high-performance engineering.",
                          style: AppTextStyles.body(isDark).copyWith(fontSize: 17, height: 1.7),
                        ),
                        const SizedBox(height: 28),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: PortfolioData.supportingExpertise.map((item) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: (isDark ? AppColors.cardBg : AppColors.lightCardBg),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: isDark ? AppColors.border : AppColors.lightBorder,
                                ),
                              ),
                              child: Text(
                                item,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  if (mobile) const SizedBox(height: 32),
                  if (!mobile) const SizedBox(width: 48),

                  // Right: Developer Info Card
                  Expanded(
                    flex: mobile ? 0 : 5,
                    child: GlassCard(
                      isDark: isDark,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Developer Profile",
                            style: AppTextStyles.cardHeading(isDark),
                          ),
                          const Divider(height: 24),
                          _infoRow("Location", PortfolioData.location, isDark),
                          const SizedBox(height: 14),
                          _infoRow("Experience", PortfolioData.experienceYears, isDark),
                          const SizedBox(height: 14),
                          _infoRow("Availability", PortfolioData.availability, isDark),
                          const SizedBox(height: 14),
                          _infoRow("Specialization", "Cross-Platform & Architecture", isDark),
                          const SizedBox(height: 14),
                          _infoRow("Work Type", "Freelance, Contract & Full-Time", isDark),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.metadata(isDark),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
          ),
        ),
      ],
    );
  }
}
