import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_heading.dart';

class SkillsSection extends StatelessWidget {
  final bool isDark;

  const SkillsSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context) || Responsive.isTablet(context);
    final categories = ["Mobile Development", "Architecture", "Backend", "Tools", "Platforms"];

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
                title: "Technical Expertise",
                subtitle: "Comprehensive mastery of the modern cross-platform engineering stack.",
                isDark: isDark,
              ),
              const SizedBox(height: 40),
              ...categories.map((category) {
                final skillsInCategory = PortfolioData.skills.where((s) => s.category == category).toList();
                if (skillsInCategory.isEmpty) return const SizedBox.shrink();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: mobile ? 1 : (Responsive.isTablet(context) ? 2 : 3),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 3.2,
                      ),
                      itemCount: skillsInCategory.length,
                      itemBuilder: (context, index) {
                        final skill = skillsInCategory[index];
                        return _SkillCard(skill: skill, isDark: isDark);
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillModel skill;
  final bool isDark;

  const _SkillCard({required this.skill, required this.isDark});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        child: GlassCard(
          isDark: widget.isDark,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          borderRadius: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.accent.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.code, size: 20, color: AppColors.accent),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.skill.name,
                            style: AppTextStyles.cardHeading(widget.isDark).copyWith(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.skill.category,
                            style: AppTextStyles.metadata(widget.isDark).copyWith(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: widget.skill.level == "Primary"
                      ? AppColors.accent.withOpacity(0.15)
                      : AppColors.secondaryAccent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  widget.skill.level,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: widget.skill.level == "Primary" ? AppColors.accent : AppColors.secondaryAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
