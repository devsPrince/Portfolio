import 'package:flutter/material.dart';
import '../../../core/widgets/status_badge.dart';
import '../../about/presentation/about_section.dart';
import '../../contact/presentation/contact_section.dart';
// import '../../experience/presentation/experience_section.dart';
import '../../freelance/presentation/freelance_section.dart';
import '../../freelance/presentation/services_section.dart';
// import '../../github/presentation/github_section.dart';
import '../../projects/presentation/projects_section.dart';
import '../../skills/presentation/skills_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;

  const HomeScreen({super.key, required this.isDark, required this.onThemeToggle});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  // final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _activeSection = "Home";

  void _scrollToSection(String section) {
    setState(() {
      _activeSection = section;
    });

    GlobalKey? key;
    switch (section) {
      case "Home":
        key = _homeKey;
        break;
      case "About":
        key = _aboutKey;
        break;
      case "Skills":
        key = _skillsKey;
        break;
      case "Projects":
        key = _projectsKey;
        break;
      // case "Experience":
      //   key = _experienceKey;
      //   break;
      case "Services":
        key = _servicesKey;
        break;
      case "Contact":
        key = _contactKey;
        break;
    }

    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Navbar(
          onNavTap: _scrollToSection,
          isDark: widget.isDark,
          onThemeToggle: widget.onThemeToggle,
          activeSection: _activeSection,
        ),
        body: SafeArea(
          child: Stack(
            children: [
                SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(key: _homeKey, child: HeroSection(onViewWork: () => _scrollToSection("Projects"), onContact: () => _scrollToSection("Contact"), isDark: widget.isDark)),
                    Container(key: _aboutKey, child: AboutSection(isDark: widget.isDark)),
                    Container(key: _skillsKey, child: SkillsSection(isDark: widget.isDark)),
                    Container(key: _projectsKey, child: ProjectsSection(isDark: widget.isDark)),

                   /// Experiences
                   // Container(key: _experienceKey, child: ExperienceSection(isDark: widget.isDark)),
                    Container(key: _servicesKey, child: ServicesSection(isDark: widget.isDark)),
                    FreelanceSection(onContact: () => _scrollToSection("Contact"), isDark: widget.isDark),
                   // Container(key: _githubKeyWidget(), child: GithubSection(isDark: widget.isDark)),
                    Container(key: _contactKey, child: ContactSection(isDark: widget.isDark)),
                    Footer(onNavTap: _scrollToSection, isDark: widget.isDark),
                  ],
                ),
              ),
              // Floating Status Badge in bottom left
              Positioned(
                left: 24,
                bottom: 24,
                child: StatusBadge(
                  onTap: () => _scrollToSection("Contact"),
                  isDark: widget.isDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // GlobalKey _githubKeyWidget() => GlobalKey();
}
