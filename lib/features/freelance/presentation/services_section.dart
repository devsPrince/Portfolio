import 'package:flutter/material.dart';
import '../../../core/animations/animated_reveal.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_heading.dart';

class ServicesSection extends StatelessWidget {
  final bool isDark;

  const ServicesSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context) || Responsive.isTablet(context);

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
                  title: "Engineering Services",
                  subtitle: "Professional capabilities tailored for startups, agencies, and product companies.",
                  isDark: isDark,
                ),
                const SizedBox(height: 24),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: mobile ? 1 : (Responsive.isTablet(context) ? 2 : 4),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: PortfolioData.services.length,
                  itemBuilder: (context, index) {
                    final service = PortfolioData.services[index];
                    return _ServiceCard(service: service, isDark: isDark);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final ServiceModel service;
  final bool isDark;

  const _ServiceCard({required this.service, required this.isDark});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
        child: GlassCard(
          isDark: widget.isDark,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.code, size: 24, color: AppColors.accent),
              ),
              const SizedBox(height: 18),
              Text(
                widget.service.title,
                style: AppTextStyles.cardHeading(widget.isDark).copyWith(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  widget.service.description,
                  style: AppTextStyles.body(widget.isDark).copyWith(fontSize: 14),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
