import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/url_launcher_util.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onNavTap;
  final bool isDark;
  final VoidCallback onThemeToggle;
  final String activeSection;

  const Navbar({
    super.key,
    required this.onNavTap,
    required this.isDark,
    required this.onThemeToggle,
    this.activeSection = "Home",
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context);
    final bool tablet = Responsive.isTablet(context);
    final bool showHamburger = mobile || tablet;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: showHamburger ? 20 : 48, vertical: 16),
      decoration: BoxDecoration(
        color: (isDark ? AppColors.primaryBg : AppColors.lightPrimaryBg).withOpacity(0.85),
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.border : AppColors.lightBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo / Name
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onNavTap("Home"),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.accent, AppColors.secondaryAccent],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "FD",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        PortfolioData.developerName,
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Desktop Nav Links
          if (!showHamburger)
            Row(
              children: [
                _navItem("Home", () => onNavTap("Home"), isDark),
                _navItem("About", () => onNavTap("About"), isDark),
                _navItem("Skills", () => onNavTap("Skills"), isDark),
                _navItem("Projects", () => onNavTap("Projects"), isDark),
                _navItem("Experience", () => onNavTap("Experience"), isDark),
                _navItem("Services", () => onNavTap("Services"), isDark),
                _navItem("Contact", () => onNavTap("Contact"), isDark),
              ],
            ),

          // Right Actions
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!showHamburger) ...[
                IconButton(
                  icon: const Icon(Icons.code, size: 20),
                  color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
                  tooltip: "GitHub Profile",
                  onPressed: () => UrlLauncherUtil.launchURL(PortfolioData.githubUrl),
                ),
                IconButton(
                  icon: const Icon(Icons.email_outlined, size: 20),
                  color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
                  tooltip: "Email Me",
                  onPressed: () => UrlLauncherUtil.launchEmail(PortfolioData.email),
                ),
                const SizedBox(width: 8),
              ],
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode, size: 20),
                color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
                tooltip: "Toggle Theme",
                onPressed: onThemeToggle,
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => onNavTap("Contact"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: showHamburger ? 14 : 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Let's Talk",
                  style: TextStyle(
                    fontFamily: 'sans-serif',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              if (showHamburger) ...[
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
                  ),
                  onPressed: () {
                    _showMobileMenu(context, onNavTap, isDark);
                  },
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap, bool isDark) {
    final bool isActive = activeSection == title;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isActive ? AppColors.accent.withOpacity(0.15) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isActive ? AppColors.accent.withOpacity(0.4) : Colors.transparent,
                width: 1,
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'sans-serif',
                fontSize: 15,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive
                    ? AppColors.accent
                    : (isDark ? AppColors.secondaryText : AppColors.lightSecondaryText),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context, Function(String) onNavTap, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.cardBg : Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 48,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryText.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Navigation Menu",
                    style: TextStyle(
                      fontFamily: 'sans-serif',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.accent,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),
                  _mobileMenuItem("Home", Icons.home_outlined, () { Navigator.pop(context); onNavTap("Home"); }, isDark),
                  _mobileMenuItem("About", Icons.person_outline, () { Navigator.pop(context); onNavTap("About"); }, isDark),
                  _mobileMenuItem("Skills", Icons.code, () { Navigator.pop(context); onNavTap("Skills"); }, isDark),
                  _mobileMenuItem("Projects", Icons.folder_outlined, () { Navigator.pop(context); onNavTap("Projects"); }, isDark),
                  _mobileMenuItem("Experience", Icons.work_outline, () { Navigator.pop(context); onNavTap("Experience"); }, isDark),
                  _mobileMenuItem("Services", Icons.design_services_outlined, () { Navigator.pop(context); onNavTap("Services"); }, isDark),
                  _mobileMenuItem("Contact", Icons.mail_outline, () { Navigator.pop(context); onNavTap("Contact"); }, isDark),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _mobileMenuItem(String title, IconData icon, VoidCallback onTap, bool isDark) {
    final bool isActive = activeSection == title;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive ? AppColors.accent : AppColors.accent.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: isActive ? Colors.white : AppColors.accent),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'sans-serif',
            fontSize: 17,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
            color: isActive ? AppColors.accent : (isDark ? AppColors.primaryText : AppColors.lightPrimaryText),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 14, color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: onTap,
      ),
    );
  }
}
