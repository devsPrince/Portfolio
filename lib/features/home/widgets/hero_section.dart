import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/url_launcher_util.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  final bool isDark;

  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context) || Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 64,
        vertical: mobile ? 40 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Flex(
            direction: mobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Content
              Expanded(
                flex: mobile ? 0 : 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.flash_on, size: 14, color: AppColors.accent),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              "AVAILABLE FOR FREELANCE & FULL-TIME OPPORTUNITIES",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.accent,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Main Heading
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.heroHeading(isDark).copyWith(
                          fontSize: mobile ? 40 : 62,
                        ),
                        children: const [
                          TextSpan(text: "Building Scalable Digital Experiences with "),
                          TextSpan(
                            text: "Flutter.",
                            style: TextStyle(color: AppColors.accent),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Supporting Text
                    Text(
                      PortfolioData.bio,
                      style: AppTextStyles.body(isDark).copyWith(
                        fontSize: mobile ? 16 : 18,
                      ),
                    ),
                    const SizedBox(height: 36),

                    // CTA Buttons
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        ElevatedButton(
                          onPressed: onViewWork,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 4,
                          ),
                          child: Text(
                            "View My Work",
                            style: AppTextStyles.button(isDark).copyWith(color: Colors.white),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: onContact,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                            side: BorderSide(
                              color: isDark ? AppColors.border : AppColors.lightBorder,
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Let's Work Together",
                            style: AppTextStyles.button(isDark).copyWith(
                              color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),

                    // Secondary Links
                    Row(
                      children: [
                        _socialLink("GitHub", Icons.code, () => UrlLauncherUtil.launchURL(PortfolioData.githubUrl), isDark),
                        const SizedBox(width: 24),
                        _socialLink("Email", Icons.email_outlined, () => UrlLauncherUtil.launchEmail(PortfolioData.email), isDark),
                        const SizedBox(width: 24),
                        _socialLink("LinkedIn", Icons.business_center_outlined, () => UrlLauncherUtil.launchURL(PortfolioData.linkedinUrl), isDark),
                      ],
                    ),
                  ],
                ),
              ),
              if (mobile) const SizedBox(height: 50),

              // Right Visual: Professional Profile Photo & Personal Details Card
              if (!mobile)
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.cardBg : AppColors.lightCardBg,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: isDark ? AppColors.border : AppColors.lightBorder,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accent.withOpacity(0.15),
                            blurRadius: 40,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Profile Photo with Glowing Ring
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [AppColors.accent, AppColors.secondaryAccent],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.accent.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 75,
                              backgroundImage: NetworkImage(PortfolioData.profileImageUrl),
                              backgroundColor: AppColors.primaryBg,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Name & Title
                          Text(
                            PortfolioData.developerName,
                            style: AppTextStyles.cardHeading(isDark).copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            PortfolioData.tagline,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.accent,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 12),

                          // Personal Details Rows
                          _detailRow("Location", PortfolioData.location, isDark),
                          const SizedBox(height: 8),
                          _detailRow("Experience", PortfolioData.experienceYears, isDark),
                          const SizedBox(height: 8),
                          _detailRow("Specialization", "Cross-Platform & Clean Architecture", isDark),
                          const SizedBox(height: 8),
                          _detailRow("Status", "Available for Hire", isDark, isSuccess: true),

                          const SizedBox(height: 20),

                          // Tech Badges Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _techBadge("Flutter", Icons.phone_android, AppColors.secondaryAccent),
                              const SizedBox(width: 8),
                              _techBadge("BLoC", Icons.layers, AppColors.accent),
                              const SizedBox(width: 8),
                              _techBadge("Firebase", Icons.local_fire_department, Colors.orange),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value, bool isDark, {bool isSuccess = false}) {
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
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSuccess ? AppColors.success : (isDark ? AppColors.primaryText : AppColors.lightPrimaryText),
          ),
        ),
      ],
    );
  }

  Widget _socialLink(String label, IconData icon, VoidCallback onTap, bool isDark) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.accent),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _techBadge(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
