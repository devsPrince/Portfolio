class ProjectModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final String image;
  final List<String> screenshots;
  final List<String> technologies;
  final List<String> platforms;
  final String? githubUrl;
  final String? androidUrl;
  final String? iosUrl;
  final String? webUrl;
  final bool featured;
  final String role;
  final String problem;
  final String solution;
  final List<String> features;
  final String architecture;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.screenshots,
    required this.technologies,
    required this.platforms,
    this.githubUrl,
    this.androidUrl,
    this.iosUrl,
    this.webUrl,
    this.featured = false,
    required this.role,
    required this.problem,
    required this.solution,
    required this.features,
    required this.architecture,
  });
}

class ExperienceModel {
  final String company;
  final String role;
  final String startDate;
  final String endDate;
  final String location;
  final String description;
  final List<String> responsibilities;
  final List<String> technologies;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.description,
    required this.responsibilities,
    required this.technologies,
  });
}

class SkillModel {
  final String name;
  final String category; // Mobile, Architecture, Backend, Tools, Platforms
  final String level; // Primary, Advanced, Working Knowledge
  final String iconName;

  const SkillModel({
    required this.name,
    required this.category,
    required this.level,
    required this.iconName,
  });
}

class ServiceModel {
  final String title;
  final String description;
  final String iconName;

  const ServiceModel({
    required this.title,
    required this.description,
    required this.iconName,
  });
}

class RepositoryModel {
  final String name;
  final String description;
  final String language;
  final int stars;
  final int forks;
  final String htmlUrl;

  const RepositoryModel({
    required this.name,
    required this.description,
    required this.language,
    required this.stars,
    required this.forks,
    required this.htmlUrl,
  });
}

class PortfolioData {
  static const String developerName = "Prince Kumar";
  static const String primaryTitle = "Flutter Developer | FlutterFlow Developer | Cross-Platform App Developer";
  static const String tagline = "Senior Flutter & FlutterFlow Architect";
  static const String profileImageUrl = "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=800&q=80";
  static const String bio = "I'm a senior Flutter & FlutterFlow developer focused on building scalable, maintainable and visually polished cross-platform applications. I work across mobile, web and desktop platforms and enjoy transforming product ideas into reliable production-ready software with Clean Architecture and BLoC.";
  static const String email = "princedev.freelance@gmail.com";
  static const String githubUrl = "https://github.com/devsPrince";
  static const String linkedinUrl = "https://www.linkedin.com/in/prince-kumar-5b2599205";
  static const String phone = "+91 9990273329";
  static const String location = "Remote / Global";
  static const String experienceYears = "5+ Years Experience";
  static const String availability = "Available for Freelance & Full-Time";

  static const List<String> supportingExpertise = [
    "Flutter", "FlutterFlow", "Dart", "Firebase", "REST APIs", "Dio", "BLoC", "Clean Architecture",
    "Android", "iOS", "Web", "macOS", "Linux", "Git", "CI/CD", "Responsive UI", "API Integration"
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      id: "p1",
      title: "SuperNanny User and Provider",
      category: "Flutter",
      description: "A dual-side childcare platform connecting parents with trained, verified nannies and babysitters. Offers flexible booking, real-time activity updates, secure payments, location tracking, and instant replacement services.",
      image: "https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&w=800&q=80",
        "https://images.unsplash.com/photo-1559526324-4b87b5e36e44?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: [ "Flutter (Dart)", "Bloc", "Cubit", "Node.js," "Firebase", "Razorpay", "Google Maps API", "Google Location Tracking", "Video conferencing" , "WebSockets"],
      platforms: ["Android", "iOS"],
      githubUrl: "https://github.com/devsPrince",
      androidUrl: "[ANDROID APP URL]",
      iosUrl: "[IOS APP URL]",
      webUrl: null,
      featured: true,
      role: "Lead Flutter Architect & Developer",
      problem: "Legacy native apps suffered from fragmented codebases, slow release cycles, and inconsistent UX across iOS and Android.",
      solution: "Engineered a robust cross-platform Flutter application leveraging Clean Architecture and BLoC state management, reducing code duplication by 65%.",
      features: [
        "Real-time transaction monitoring with WebSocket integration",
        "Advanced biometric security (FaceID / Fingerprint)",
        "Offline-first transaction queueing and local encryption",
        "Custom high-performance financial charts and graphs"
      ],
      architecture: "Clean Architecture (Presentation -> Domain -> Data) powered by flutter_bloc and Dio for robust networking."
    ),
    ProjectModel(
      id: "p2",
      title: "SaaS Dashboard & Workflow Automation",
      category: "FlutterFlow & Web",
      description: "Comprehensive multi-tenant SaaS admin portal built with Flutter Web and integrated custom Dart backend services for business process automation.",
      image: "https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["FlutterFlow", "Flutter Web", "Firebase", "Cloud Functions", "Tailwind CSS UI"],
      platforms: ["Web", "macOS", "Linux"],
      githubUrl: "https://github.com/devsPrince",
      androidUrl: null,
      iosUrl: null,
      webUrl: "[LIVE DEMO URL]",
      featured: true,
      role: "Senior FlutterFlow & Web Engineer",
      problem: "Clients needed an ultra-fast MVP for business workflow automation with complex custom logic that standard no-code tools couldn't handle.",
      solution: "Combined FlutterFlow rapid prototyping with custom Dart code blocks and Firebase Cloud Functions to deliver a production-ready enterprise SaaS portal.",
      features: [
        "Dynamic role-based access control (RBAC)",
        "Complex data grid with pagination, sorting, and CSV export",
        "Automated webhook triggers and real-time dashboard updates",
        "Fully responsive layout optimized for desktop and tablet displays"
      ],
      architecture: "Modular feature-first structure with Firebase Auth and Firestore reactive streams."
    ),
    ProjectModel(
      id: "p3",
      title: "E-Commerce & Live Streaming Marketplace",
      category: "Mobile",
      description: "Feature-rich mobile marketplace featuring live-stream shopping, secure payment gateways, instant push notifications, and AI product recommendations.",
      image: "https://images.unsplash.com/photo-1472851294608-062f824d29cc?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1472851294608-062f824d29cc?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter", "Dart", "Firebase", "Agora SDK", "Stripe API", "Provider"],
      platforms: ["Android", "iOS", "Web"],
      githubUrl: "https://github.com/devsPrince",
      androidUrl: "[ANDROID APP URL]",
      iosUrl: "[IOS APP URL]",
      webUrl: "[LIVE DEMO URL]",
      featured: false,
      role: "Senior Cross-Platform Developer",
      problem: "High latency during live video broadcasts and checkout drop-offs plagued the previous legacy tech stack.",
      solution: "Integrated Agora RTC for ultra-low latency live streaming and optimized checkout flows with Stripe and Apple/Google Pay.",
      features: [
        "Interactive live video streaming with real-time chat & reactions",
        "Seamless cart and checkout with multiple payment providers",
        "Personalized push notifications via Firebase Cloud Messaging",
        "Advanced search filters with instant debouncing"
      ],
      architecture: "Repository pattern with cached local database and cloud sync."
    ),
    ProjectModel(
      id: "p4",
      title: "Healthcare Tele-Consultation App",
      category: "Firebase",
      description: "HIPAA-compliant telemedicine application connecting patients with certified medical professionals through secure video calls and encrypted chat.",
      image: "https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter", "Dart", "BLoC", "WebRTC", "Firebase Firestore", "Cloud Functions"],
      platforms: ["Android", "iOS", "Web"],
      githubUrl: "https://github.com/devsPrince",
      androidUrl: "[ANDROID APP URL]",
      iosUrl: "[IOS APP URL]",
      webUrl: null,
      featured: false,
      role: "Lead Mobile Developer",
      problem: "Strict security and low-latency audio/video requirements demanded a bulletproof architecture.",
      solution: "Implemented WebRTC protocol with end-to-end encrypted Firestore messaging and stringent access policies.",
      features: [
        "Secure one-on-one HD video consultations",
        "Encrypted prescription sharing and medical history logs",
        "Appointment booking calendar with automated push reminders",
        "Multi-language support for international patients"
      ],
      architecture: "Clean Architecture with strict domain models and unit-tested use cases."
    ),
  ];

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      company: "[COMPANY NAME - 1]",
      role: "Lead Senior Flutter Developer",
      startDate: "2023",
      endDate: "Present",
      location: "Remote",
      description: "Leading the mobile and cross-platform engineering division, building enterprise-grade applications used by hundreds of thousands of users.",
      responsibilities: [
        "Architected and delivered 3 core production applications using Flutter and BLoC pattern.",
        "Mentored junior and mid-level developers, establishing robust code review standards and CI/CD pipelines.",
        "Optimized app performance, reducing frame render times by 40% and memory footprint on low-end Android devices.",
        "Collaborated closely with UI/UX designers to implement pixel-perfect design systems."
      ],
      technologies: ["Flutter", "Dart", "BLoC", "Clean Architecture", "Firebase", "CI/CD", "REST APIs"]
    ),
    ExperienceModel(
      company: "[COMPANY NAME - 2]",
      role: "Senior Flutter & FlutterFlow Engineer",
      startDate: "2021",
      endDate: "2023",
      location: "Hybrid / Remote",
      description: "Specialized in rapid MVP development using FlutterFlow alongside custom Flutter modules for high-growth startups.",
      responsibilities: [
        "Developed and launched 8+ production MVPs using FlutterFlow and custom Dart functions.",
        "Integrated complex third-party REST APIs, payment gateways (Stripe, PayPal), and push notification services.",
        "Refactored legacy spaghetti codebases into clean, modular, testable architectures.",
        "Implemented responsive UI layouts supporting mobile, tablet, and desktop viewports."
      ],
      technologies: ["Flutter", "FlutterFlow", "Dart", "REST APIs", "Firebase", "Git", "Postman"]
    ),
    ExperienceModel(
      company: "[COMPANY NAME - 3]",
      role: "Cross-Platform App Developer",
      startDate: "2019",
      endDate: "2021",
      location: "On-site",
      description: "Focused on native Android & iOS application development before transitioning to Flutter cross-platform ecosystem.",
      responsibilities: [
        "Built native mobile features in Kotlin and Swift while helping spearhead the company's migration to Flutter.",
        "Managed app store deployment processes for Google Play and Apple App Store.",
        "Conducted automated and manual testing to ensure zero-defect releases."
      ],
      technologies: ["Android", "iOS", "Kotlin", "Swift", "Flutter", "Git"]
    ),
  ];

  static const List<SkillModel> skills = [
    // Mobile & Core
    SkillModel(name: "Flutter", category: "Mobile Development", level: "Primary", iconName: "flutter"),
    SkillModel(name: "Dart", category: "Mobile Development", level: "Primary", iconName: "code"),
    SkillModel(name: "FlutterFlow", category: "Mobile Development", level: "Primary", iconName: "flash"),
    SkillModel(name: "Android", category: "Mobile Development", level: "Advanced", iconName: "android"),
    SkillModel(name: "iOS", category: "Mobile Development", level: "Advanced", iconName: "apple"),

    // Architecture
    SkillModel(name: "BLoC / Cubit", category: "Architecture", level: "Primary", iconName: "layers"),
    SkillModel(name: "Clean Architecture", category: "Architecture", level: "Primary", iconName: "grid"),
    SkillModel(name: "SOLID Principles", category: "Architecture", level: "Primary", iconName: "shield"),
    SkillModel(name: "Repository Pattern", category: "Architecture", level: "Primary", iconName: "database"),
    SkillModel(name: "Dependency Injection", category: "Architecture", level: "Advanced", iconName: "cpu"),

    // Backend & API
    SkillModel(name: "Firebase", category: "Backend", level: "Primary", iconName: "flame"),
    SkillModel(name: "REST APIs", category: "Backend", level: "Primary", iconName: "cloud"),
    SkillModel(name: "Dio HTTP Client", category: "Backend", level: "Primary", iconName: "globe"),
    SkillModel(name: "Authentication", category: "Backend", level: "Primary", iconName: "lock"),
    SkillModel(name: "Cloud Firestore", category: "Backend", level: "Advanced", iconName: "server"),

    // Tools & Platforms
    SkillModel(name: "Git & GitHub", category: "Tools", level: "Primary", iconName: "git"),
    SkillModel(name: "Postman", category: "Tools", level: "Advanced", iconName: "send"),
    SkillModel(name: "Figma", category: "Tools", level: "Advanced", iconName: "figma"),
    SkillModel(name: "Android Studio", category: "Tools", level: "Primary", iconName: "code"),
    SkillModel(name: "VS Code", category: "Tools", level: "Primary", iconName: "edit"),
    SkillModel(name: "Web / macOS / Linux", category: "Platforms", level: "Advanced", iconName: "monitor"),
  ];

  static const List<ServiceModel> services = [
    ServiceModel(
      title: "Flutter App Development",
      description: "End-to-end custom mobile app development from scratch with high performance, smooth animations, and native device capabilities.",
      iconName: "smartphone"
    ),
    ServiceModel(
      title: "FlutterFlow Development",
      description: "Rapid MVP creation and complex custom widget/action development using FlutterFlow combined with custom Dart code.",
      iconName: "zap"
    ),
    ServiceModel(
      title: "Cross-Platform Solutions",
      description: "Single codebase deployment across Android, iOS, Web, macOS, and Linux with responsive layouts and pixel-perfect design.",
      iconName: "layers"
    ),
    ServiceModel(
      title: "UI/UX Implementation",
      description: "Translating Figma designs into responsive, accessible, and polished user interfaces with meticulous attention to detail.",
      iconName: "layout"
    ),
    ServiceModel(
      title: "API & Backend Integration",
      description: "Robust REST API integration using Dio, WebSocket communication, secure authentication, and Firebase backend services.",
      iconName: "server"
    ),
    ServiceModel(
      title: "Architecture & Refactoring",
      description: "Upgrading legacy spaghetti codebases to Clean Architecture with BLoC state management and SOLID design principles.",
      iconName: "cpu"
    ),
    ServiceModel(
      title: "App Maintenance & Scaling",
      description: "Bug fixing, performance profiling, memory optimization, and preparing applications for scale and high traffic.",
      iconName: "trending-up"
    ),
    ServiceModel(
      title: "App Store Publishing",
      description: "Guiding applications successfully through Google Play Console and Apple App Store review and publishing pipelines.",
      iconName: "upload-cloud"
    ),
  ];

  static const List<RepositoryModel> repositories = [
    RepositoryModel(
      name: "flutter_clean_architecture_template",
      description: "A production-ready boilerplate incorporating Clean Architecture, BLoC, Dio networking, and modular feature separation.",
      language: "Dart",
      stars: 342,
      forks: 78,
      htmlUrl: "https://github.com/devsPrince"
    ),
    RepositoryModel(
      name: "flutterflow_custom_widgets_pack",
      description: "Collection of advanced custom widgets, animations, and custom actions for FlutterFlow developers.",
      language: "Dart",
      stars: 189,
      forks: 41,
      htmlUrl: "https://github.com/devsPrince"
    ),
    RepositoryModel(
      name: "secure_biometric_auth_package",
      description: "Lightweight wrapper for local biometric authentication with encrypted token storage in Flutter.",
      language: "Dart",
      stars: 124,
      forks: 22,
      htmlUrl: "https://github.com/devsPrince"
    ),
    RepositoryModel(
      name: "cross_platform_responsive_ui",
      description: "Utilities and layout widgets for building adaptive applications across mobile, tablet, and desktop screens.",
      language: "Dart",
      stars: 215,
      forks: 36,
      htmlUrl: "https://github.com/devsPrince"
    ),
  ];

  static const List<String> freelanceSteps = [
    "01 — Discovery: Understanding your product vision, goals, and technical requirements.",
    "02 — Planning: Defining architecture, technology stack, milestones, and deliverables.",
    "03 — UI/UX: Translating wireframes into polished, responsive, and intuitive interfaces.",
    "04 — Development: Writing clean, tested, maintainable code using BLoC & Clean Architecture.",
    "05 — Testing: Rigorous QA across multiple devices, screen sizes, and OS versions.",
    "06 — Deployment: Publishing to Google Play, Apple App Store, or web hosting platforms.",
    "07 — Support: Ongoing maintenance, performance tuning, and feature scaling."
  ];
}
