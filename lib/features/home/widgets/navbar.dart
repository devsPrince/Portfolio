import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/url_launcher_util.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onNavTap;
  final bool isDark;
  final VoidCallback onThemeToggle;

  const Navbar({
    super.key,
    required this.onNavTap,
    required this.isDark,
    required this.onThemeToggle,
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
                        style: GoogleFonts.plusJakartaSans(
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
                  style: GoogleFonts.plusJakartaSans(
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.secondaryText.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              _mobileMenuItem("Home", () { Navigator.pop(context); onNavTap("Home"); }, isDark),
              _mobileMenuItem("About", () { Navigator.pop(context); onNavTap("About"); }, isDark),
              _mobileMenuItem("Skills", () { Navigator.pop(context); onNavTap("Skills"); }, isDark),
              _mobileMenuItem("Projects", () { Navigator.pop(context); onNavTap("Projects"); }, isDark),
              _mobileMenuItem("Experience", () { Navigator.pop(context); onNavTap("Experience"); }, isDark),
              _mobileMenuItem("Services", () { Navigator.pop(context); onNavTap("Services"); }, isDark),
              _mobileMenuItem("Contact", () { Navigator.pop(context); onNavTap("Contact"); }, isDark),
            ],
          ),
        );
      },
    );
  }

  Widget _mobileMenuItem(String title, VoidCallback onTap, bool isDark) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
        ),
      ),
      onTap: onTap,
    );
  }
}
