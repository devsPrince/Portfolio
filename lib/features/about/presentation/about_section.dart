import 'package:flutter/material.dart';
import '../../../core/animations/animated_reveal.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/section_heading.dart';

class AboutSection extends StatelessWidget {
  final bool isDark;

  const AboutSection({super.key, required this.isDark});

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
                SectionHeading(
                  title: "About Me",
                  subtitle: "Architecting high-performance applications with precision and scalability.",
                  isDark: isDark,
                ),
                const SizedBox(height: 40),
                Text(
                  "I’m a senior Flutter & FlutterFlow developer focused on building scalable, maintainable and visually polished cross-platform applications. I work across mobile, web and desktop platforms and enjoy transforming product ideas into reliable production-ready software.",
                  style: AppTextStyles.body(isDark).copyWith(fontSize: 17, height: 1.7),
                ),
                const SizedBox(height: 20),
                Text(
                  "With deep expertise in Clean Architecture, BLoC state management, and SOLID principles, I ensure every codebase is robust, modular, and easy to scale. Whether building complex enterprise applications or rapid MVPs, I bridge the gap between world-class design and high-performance engineering.",
                  style: AppTextStyles.body(isDark).copyWith(fontSize: 17, height: 1.7),
                ),
                const SizedBox(height: 48),

                // Core Engineering Pillars
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: mobile ? 1 : 3,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: mobile ? 1.4 : 1.15,
                  children: [
                    _AboutPillarCard(
                      title: "Clean Architecture",
                      description: "Strict separation of concerns (Presentation → Domain → Data) ensuring testable and maintainable codebases.",
                      icon: Icons.grid_view_rounded,
                      isDark: isDark,
                    ),
                    _AboutPillarCard(
                      title: "Cross-Platform Mastery",
                      description: "Single codebase excellence deployed seamlessly across Android, iOS, Web, macOS, and Linux.",
                      icon: Icons.devices_rounded,
                      isDark: isDark,
                    ),
                    _AboutPillarCard(
                      title: "State & Performance",
                      description: "Optimized BLoC/Cubit state management, smooth 60fps animations, and zero memory leaks.",
                      icon: Icons.speed_rounded,
                      isDark: isDark,
                    ),
                  ],
                ),
                const SizedBox(height: 48),

                // Expertise Chips Header
                Text(
                  "Core Technologies & Ecosystem",
                  style: TextStyle(
                    fontFamily: 'sans-serif',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: PortfolioData.supportingExpertise.map((item) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: (isDark ? AppColors.cardBg : AppColors.lightCardBg),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isDark ? AppColors.border : AppColors.lightBorder,
                        ),
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryAccent,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AboutPillarCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isDark;

  const _AboutPillarCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.isDark,
  });

  @override
  State<_AboutPillarCard> createState() => _AboutPillarCardState();
}

class _AboutPillarCardState extends State<_AboutPillarCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: widget.isDark ? AppColors.cardBg.withValues(alpha: 0.9) : AppColors.lightCardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppColors.accent.withValues(alpha: 0.6) : (widget.isDark ? AppColors.border : AppColors.lightBorder),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? AppColors.accent.withValues(alpha: 0.25) : Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, size: 28, color: AppColors.accent),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'sans-serif',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: widget.isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                widget.description,
                style: AppTextStyles.body(widget.isDark).copyWith(fontSize: 14, height: 1.6),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
