import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/url_launcher_util.dart';

class Footer extends StatelessWidget {
  final Function(String) onNavTap;
  final bool isDark;

  const Footer({super.key, required this.onNavTap, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context) || Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 64,
        vertical: 40,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.secondaryBg : AppColors.lightSecondaryBg,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.border : AppColors.lightBorder,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Column(
            children: [
              Flex(
                direction: mobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        PortfolioData.developerName,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Flutter Developer • Cross-Platform App Developer",
                        style: AppTextStyles.metadata(isDark),
                      ),
                    ],
                  ),
                  if (mobile) const SizedBox(height: 24),
                  Wrap(
                    spacing: 24,
                    runSpacing: 12,
                    children: [
                      _footerLink("Home", () => onNavTap("Home"), isDark),
                      _footerLink("About", () => onNavTap("About"), isDark),
                      _footerLink("Skills", () => onNavTap("Skills"), isDark),
                      _footerLink("Projects", () => onNavTap("Projects"), isDark),
                      _footerLink("Experience", () => onNavTap("Experience"), isDark),
                      _footerLink("Services", () => onNavTap("Services"), isDark),
                      _footerLink("Contact", () => onNavTap("Contact"), isDark),
                    ],
                  ),
                ],
              ),
              const Divider(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "© 2026 ${PortfolioData.developerName}. Built with Flutter.",
                      style: AppTextStyles.metadata(isDark),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.code, size: 18),
                        color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
                        onPressed: () => UrlLauncherUtil.launchURL(PortfolioData.githubUrl),
                      ),
                      IconButton(
                        icon: const Icon(Icons.business_center_outlined, size: 18),
                        color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
                        onPressed: () => UrlLauncherUtil.launchURL(PortfolioData.linkedinUrl),
                      ),
                      IconButton(
                        icon: const Icon(Icons.email_outlined, size: 18),
                        color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
                        onPressed: () => UrlLauncherUtil.launchEmail(PortfolioData.email),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerLink(String title, VoidCallback onTap, bool isDark) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
          ),
        ),
      ),
    );
  }
}
