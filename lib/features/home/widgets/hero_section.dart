import 'package:flutter/material.dart';
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
              // In mobile view, show profile card first or integrated in column
              if (mobile) ...[
                _buildProfileCard(isDark),
                const SizedBox(height: 40),
              ],

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
                        color: AppColors.accent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.flash_on, size: 14, color: AppColors.accent),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              "AVAILABLE FOR FREELANCE & FULL-TIME OPPORTUNITIES",
                              style: TextStyle(
                                fontFamily: 'sans-serif',
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
                          fontSize: mobile ? 38 : 62,
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

              // Right Visual: Professional Profile Photo & Personal Details Card (Desktop)
              if (!mobile)
                Expanded(
                  flex: 5,
                  child: Center(
                    child: _buildProfileCard(isDark),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardBg.withValues(alpha: 0.9) : AppColors.lightCardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.2),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Profile Photo with Glowing Aura & Verified Badge
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.accent, AppColors.secondaryAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.4),
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: PortfolioData.profileImageUrl.startsWith('assets/')
                      ? AssetImage(PortfolioData.profileImageUrl) as ImageProvider
                      : NetworkImage(PortfolioData.profileImageUrl),
                  backgroundColor: AppColors.primaryBg,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 16, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Name & Title
          Text(
            PortfolioData.developerName,
            style: AppTextStyles.cardHeading(isDark).copyWith(fontSize: 26, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppColors.accent, AppColors.secondaryAccent],
            ).createShader(bounds),
            child: Text(
              PortfolioData.tagline,
              style: TextStyle(
                fontFamily: 'sans-serif',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Divider(height: 1),
          const SizedBox(height: 18),

          // Personal Details Rows with Icons
          _detailRow(Icons.location_on_outlined, "Location", PortfolioData.location, isDark),
          const SizedBox(height: 12),
          _detailRow(Icons.work_outline, "Experience", PortfolioData.experienceYears, isDark),
          const SizedBox(height: 12),
          _detailRow(Icons.architecture, "Specialization", "Cross-Platform & Clean Arch", isDark),
          const SizedBox(height: 12),
          _detailRow(Icons.fiber_manual_record, "Status", "Available for Hire", isDark, isSuccess: true),

          const SizedBox(height: 22),

          // Tech Badges Wrap
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _techBadge("Flutter", Icons.phone_android, AppColors.secondaryAccent),
              _techBadge("FlutterFlow", Icons.flash_on, AppColors.accent),
              _techBadge("BLoC / Arch", Icons.layers, AppColors.success),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value, bool isDark, {bool isSuccess = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: AppColors.accent),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.metadata(isDark),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'sans-serif',
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
              style: TextStyle(
                fontFamily: 'sans-serif',
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
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'sans-serif',
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
