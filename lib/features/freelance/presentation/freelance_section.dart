import 'package:flutter/material.dart';
import '../../../core/animations/animated_reveal.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_heading.dart';

class FreelanceSection extends StatelessWidget {
  final VoidCallback onContact;
  final bool isDark;

  const FreelanceSection({super.key, required this.onContact, required this.isDark});

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
                  title: "Freelance & Client Work",
                  subtitle: "Partnering with ambitious founders and teams to turn concepts into robust market-ready products.",
                  isDark: isDark,
                ),
                const SizedBox(height: 40),
                GlassCard(
                  isDark: isDark,
                  padding: EdgeInsets.all(mobile ? 24 : 48),
                  child: Flex(
                    direction: mobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: mobile ? 0 : 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Have an idea or product you want to build?",
                              style: AppTextStyles.cardHeading(isDark).copyWith(fontSize: 26),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "I help startups and businesses build mobile applications, convert ideas into MVPs, integrate complex APIs and Firebase backends, refactor architecture, and publish polished applications to Google Play and the App Store.",
                              style: AppTextStyles.body(isDark),
                            ),
                            const SizedBox(height: 28),
                            ElevatedButton(
                              onPressed: onContact,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accent,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Text(
                                "Let's Build It",
                                style: AppTextStyles.button(isDark).copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (mobile) const SizedBox(height: 36),
                      if (!mobile) const SizedBox(width: 48),
                      Expanded(
                        flex: mobile ? 0 : 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Development Process",
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.secondaryAccent,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ...PortfolioData.freelanceSteps.map((step) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.arrow_right, color: AppColors.accent, size: 20),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          step,
                                          style: AppTextStyles.body(isDark).copyWith(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
