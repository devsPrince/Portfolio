import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/animations/animated_reveal.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_heading.dart';
import '../bloc/contact_cubit.dart';

class ContactSection extends StatelessWidget {
  final bool isDark;

  const ContactSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context) || Responsive.isTablet(context);

    return BlocProvider(
      create: (_) => ContactCubit(),
      child: AnimatedReveal(
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
                    title: "Let's Build Something Great",
                    subtitle: "Have an idea, product or application you want to build? Let's talk.",
                    isDark: isDark,
                  ),
                  const SizedBox(height: 24),
                  Flex(
                    direction: mobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Info
                      Expanded(
                        flex: mobile ? 0 : 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Get in touch",
                              style: AppTextStyles.cardHeading(isDark).copyWith(fontSize: 22),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "I'm always open to discussing new projects, creative ideas, or opportunities to be part of your product vision.",
                              style: AppTextStyles.body(isDark),
                            ),
                            const SizedBox(height: 32),
                            _contactInfoTile(Icons.email_outlined, "Email", PortfolioData.email, () => UrlLauncherUtil.launchEmail(PortfolioData.email), isDark),
                            const SizedBox(height: 16),
                            _contactInfoTile(Icons.code, "GitHub", PortfolioData.githubUrl, () => UrlLauncherUtil.launchURL(PortfolioData.githubUrl), isDark),
                            const SizedBox(height: 16),
                            _contactInfoTile(Icons.terminal, "GitLab", PortfolioData.gitLabUrl, () => UrlLauncherUtil.launchURL(PortfolioData.gitLabUrl), isDark),
                            const SizedBox(height: 16),
                            _contactInfoTile(Icons.business_center_outlined, "LinkedIn", PortfolioData.linkedinUrl, () => UrlLauncherUtil.launchURL(PortfolioData.linkedinUrl), isDark),
                            // const SizedBox(height: 16),
                            // _contactInfoTile(Icons.phone_outlined, "Phone", PortfolioData.phone, () {}, isDark),
                          ],
                        ),
                      ),
                      if (mobile) const SizedBox(height: 40),
                      if (!mobile) const SizedBox(width: 48),

                      // Right Form
                      Expanded(
                        flex: mobile ? 0 : 7,
                        child: GlassCard(
                          isDark: isDark,
                          padding: EdgeInsets.all(mobile ? 24 : 36),
                          child: const _ContactFormView(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _contactInfoTile(IconData icon, String label, String value, VoidCallback onTap, bool isDark) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: AppColors.accent),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppTextStyles.metadata(isDark)),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      fontFamily: 'sans-serif',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactFormView extends StatefulWidget {
  const _ContactFormView();

  @override
  State<_ContactFormView> createState() => _ContactFormViewState();
}

class _ContactFormViewState extends State<_ContactFormView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _projectTypeController = TextEditingController();
  final _budgetController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _projectTypeController.dispose();
    _budgetController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bool isNarrow = MediaQuery.of(context).size.width < 700;

    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state is ContactSuccess) {
          _nameController.clear();
          _emailController.clear();
          _projectTypeController.clear();
          _budgetController.clear();
          _messageController.clear();
        }
      },
      builder: (context, state) {
        if (state is ContactSuccess) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle_outline, size: 64, color: AppColors.success),
                  const SizedBox(height: 16),
                  Text(
                    "Message Sent!",
                    style: AppTextStyles.cardHeading(isDark).copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body(isDark),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.read<ContactCubit>().reset(),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, foregroundColor: Colors.white),
                    child: const Text("Send Another Message"),
                  ),
                ],
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state is ContactError) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 20),
                    const SizedBox(width: 10),
                    Expanded(child: Text(state.error, style: const TextStyle(color: Colors.red, fontSize: 13))),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            if (isNarrow) ...[
              _buildTextField("Your Name *", _nameController, isDark),
              const SizedBox(height: 16),
              _buildTextField("Your Email *", _emailController, isDark),
            ] else ...[
              Row(
                children: [
                  Expanded(child: _buildTextField("Your Name *", _nameController, isDark)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField("Your Email *", _emailController, isDark)),
                ],
              ),
            ],
            const SizedBox(height: 16),
            if (isNarrow) ...[
              _buildTextField("Project Type (e.g. Flutter Mobile App)", _projectTypeController, isDark),
              const SizedBox(height: 16),
              _buildTextField("Budget Range (Optional)", _budgetController, isDark),
            ] else ...[
              Row(
                children: [
                  Expanded(child: _buildTextField("Project Type (e.g. Flutter Mobile App)", _projectTypeController, isDark)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField("Budget Range (Optional)", _budgetController, isDark)),
                ],
              ),
            ],
            const SizedBox(height: 16),
            _buildTextField("Message / Project Details *", _messageController, isDark, maxLines: 5),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: state is ContactLoading
                    ? null
                    : () {
                        context.read<ContactCubit>().submitMessage(
                              name: _nameController.text,
                              email: _emailController.text,
                              projectType: _projectTypeController.text,
                              budget: _budgetController.text,
                              message: _messageController.text,
                            );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: state is ContactLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text("Send Message", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool isDark, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText, fontSize: 15),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText, fontSize: 14),
        filled: true,
        fillColor: isDark ? AppColors.primaryBg : AppColors.lightSecondaryBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: isDark ? AppColors.border : AppColors.lightBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: isDark ? AppColors.border : AppColors.lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
      ),
    );
  }
}
