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
  final String? gitLabUrl;
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
    this.gitLabUrl,
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
  static const String tagline = "Senior Flutter & FlutterFlow Developer";
  static const String profileImageUrl =  "assets/images/profile_image.png";
  static const String bio = "I'm a senior Flutter & FlutterFlow developer focused on building scalable, maintainable and visually polished cross-platform applications. I work across mobile, web and desktop platforms and enjoy transforming product ideas into reliable production-ready software with Clean Architecture, BLoC, Riverpod, Provider, and GetX.";
  static const String email = "princedev.freelance@gmail.com";
  static const String githubUrl = "https://github.com/devsPrince";
  static const String gitLabUrl = "https://gitlab.com/princedev.freelance";
  static const String linkedinUrl = "https://www.linkedin.com/in/prince-kumar-5b2599205";
  // static const String phone = "+91 9990273329";
  static const String location = "Remote / Global";
  static const String experienceYears = "5+ Years Experience";
  static const String availability = "Available for Freelance & Full-Time";

  static const List<String> supportingExpertise = [
    "Flutter", "FlutterFlow", "Dart", "Firebase", "REST APIs", "Dio", "BLoC", "Riverpod", "Provider", "GetX", "Clean Architecture",
    "Android", "iOS", "Web", "macOS", "Linux", "Git", "CI/CD", "Responsive UI", "API Integration"
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      id: "p1",
      title: "4FC - Rap Music Battle",
      category: "Flutter",
      description: "A global rap battle platform where users can challenge opponents, place coin bets, select judges, and use custom beats. Premium features include hidden voting, private invites, MP3 export, and exclusive challenges.",
      image: "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "GetX", "Node.js", "Firebase", "In-App Purchases", "WebSockets"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.fourfc",
      iosUrl: "https://apps.apple.com/in/app/4fc-rap-music-battle/id6468482326",
      featured: true,
      role: "Senior Flutter Developer",
      problem: "Needed a high-performance real-time global multiplayer matchmaking and betting platform for rap battles.",
      solution: "Engineered real-time WebSocket matching, audio beat synchronization, and secure in-app purchases with GetX architecture.",
      features: [
        "Real-time rap battle matchmaking & coin betting",
        "Custom beat selection and MP3 exporting",
        "Hidden voting system and private battle invites",
        "In-app purchases for exclusive challenges"
      ],
      architecture: "GetX reactive state management with modular services and WebSocket event streams."
    ),
    ProjectModel(
      id: "p2",
      title: "SuperNanny User and Provider",
      category: "Flutter",
      description: "A dual-side childcare platform connecting parents with trained, verified nannies and babysitters. Offers flexible booking, real-time activity updates, secure payments, location tracking, and instant replacement services.",
      image: "https://images.unsplash.com/photo-1544717305-2782549b5136?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1544717305-2782549b5136?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "Bloc", "Cubit", "Node.js", "Firebase", "Razorpay", "Google Maps API", "WebSockets"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.supernan&pcampaignid=web_share",
      iosUrl: "https://apps.apple.com/in/app/supernan-the-nanny-you-need/id6460034352",
      featured: true,
      role: "Lead Flutter Architect",
      problem: "Coordinating real-time childcare bookings and live location tracking between parents and providers securely.",
      solution: "Built dual-sided applications (User & Provider) with BLoC architecture, Razorpay payments, and live Google Maps tracking.",
      features: [
        "Flexible nanny booking and real-time activity updates",
        "Live location tracking and instant replacement services",
        "Secure payments via Razorpay integration",
        "In-app video conferencing and instant chat via WebSockets"
      ],
      architecture: "Clean Architecture with BLoC state management and reactive repository streams."
    ),
    ProjectModel(
      id: "p3",
      title: "Online Stage: Music Event & Job",
      category: "Flutter",
      description: "An all-in-one creative platform for musicians, artists, event organizers, and live arts professionals to promote events, share content, sell products, post job opportunities, and build professional connections.",
      image: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "GetX", "Node.js", "Firebase", "Google Maps API", "Reel Feature", "In-App Purchases", "WebSockets"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.app.onstages&hl=en_IN",
      iosUrl: "https://apps.apple.com/in/app/online-stage-music-event-job/id6743424349",
      featured: true,
      role: "Senior Cross-Platform Developer",
      problem: "Artists and event planners lacked a dedicated networking and event management marketplace.",
      solution: "Developed a feature-dense platform supporting media reels, job postings, event ticketing, and real-time chat.",
      features: [
        "Music event promotion and ticket booking",
        "Short-form video reel sharing for artists",
        "Job board for music and entertainment professionals",
        "Real-time networking and chat via WebSockets"
      ],
      architecture: "GetX controller pattern with reactive Firebase Firestore bindings."
    ),
    ProjectModel(
      id: "p4",
      title: "Samtawad",
      category: "Flutter",
      description: "A spiritual app offering access to Samtavad philosophy through books, audio, and video content, guiding users toward eternal peace and self-realization following equanimity teachings.",
      image: "https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "setState", "Node.js", "Firebase", "Video/Audio Streaming"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.pro.samta",
      iosUrl: "https://apps.apple.com/in/app/samtawad/id1658548280",
      featured: false,
      role: "Flutter Developer",
      problem: "Delivering smooth audio and video streaming of spiritual discourses across mobile devices.",
      solution: "Implemented robust media playback pipelines with Firebase backend and clean streaming architecture.",
      features: [
        "Digital library of philosophical books and publications",
        "High-quality audio and video streaming of discourses",
        "Daily quotes and mindfulness reflections",
        "Clean, distraction-free reading UI"
      ],
      architecture: "Modular widget structure with optimized media streaming controllers."
    ),
    ProjectModel(
      id: "p5",
      title: "Party Plan (User & Provider)",
      category: "Flutter",
      description: "A two-sided event planning platform connecting users with verified local professionals across 50+ service categories. Users can browse, book, and post event jobs, while providers can list services and get unlimited leads.",
      image: "https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "GetX", "Node.js", "Firebase", "In-App Purchases", "WebSockets"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.app.partyplans",
      iosUrl: "https://apps.apple.com/in/app/partyplans-find-event-pros/id6618148968",
      featured: true,
      role: "Lead Mobile Developer",
      problem: "Coordinating event planners and service providers with lead generation and white-labeling.",
      solution: "Built dual-sided apps (User & Provider) with GetX, secure messaging, and flexible job posting workflows.",
      features: [
        "Browse and book event pros across 50+ categories",
        "Job posting and bidding for event services",
        "Provider lead generation and white-label tools",
        "Real-time chat and quote negotiation"
      ],
      architecture: "GetX state management with modular dependency injection."
    ),
    ProjectModel(
      id: "p6",
      title: "Muslims Map",
      category: "FlutterFlow",
      description: "A community-driven platform helping users discover and support Muslim-owned businesses, places of worship, events, and services in non-Muslim countries with interactive maps and reviews, built rapidly with FlutterFlow.",
      image: "https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["FlutterFlow", "Firebase", "Google Maps API", "In-App Purchases", "Custom Actions"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.app.muslimsmap",
      iosUrl: "https://apps.apple.com/in/app/muslims-map/id6504747059",
      featured: false,
      role: "Senior FlutterFlow Developer",
      problem: "Making it easy for communities to discover verified businesses and mosques abroad with rapid MVP delivery.",
      solution: "Engineered with FlutterFlow and Google Maps API, integrating custom marker clustering and business listing management.",
      features: [
        "Interactive map discovery of verified businesses and mosques",
        "Community reviews and ratings",
        "Business owner listing and verification portal",
        "Promoted placement via in-app purchases"
      ],
      architecture: "FlutterFlow front-end with Firebase backend and custom map clustering actions."
    ),
    ProjectModel(
      id: "p7",
      title: "Black Primacy",
      category: "FlutterFlow",
      description: "A global platform for discovering and supporting Black-owned businesses, featuring interactive maps with custom markers, reviews, and direct contact details, built with FlutterFlow.",
      image: "https://images.unsplash.com/photo-1573164713988-8665fc963095?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1573164713988-8665fc963095?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["FlutterFlow", "Firebase", "Google Maps API", "In-App Purchases", "Custom Dart"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.app.blackprimacy",
      iosUrl: "https://apps.apple.com/in/app/black-primacy/id1604784917",
      featured: false,
      role: "Senior FlutterFlow Developer",
      problem: "Building a searchable directory and interactive map for Black-owned enterprises rapidly and scalably.",
      solution: "Developed using FlutterFlow visual builder with geo-spatial queries and Google Maps place details.",
      features: [
        "Geo-localized business discovery map",
        "Detailed shop profiles and contact information",
        "User reviews and community curation",
        "Monetized business promotion features"
      ],
      architecture: "FlutterFlow low-code framework with Firebase Firestore backend and Google Maps integrations."
    ),
    ProjectModel(
      id: "p8",
      title: "Ownitoo Marketplace",
      category: "Flutter",
      description: "A versatile marketplace platform offering fixed-price sales, auction-style bidding, and a unique co-ownership option for shared asset purchases, alongside digital sticker trading.",
      image: "https://images.unsplash.com/photo-1556742049-0a67d553c2a5?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1556742049-0a67d553c2a5?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "Provider", "Node.js", "Firebase", "Stripe Payment Gateway"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.app.ownitoo&pcampaignid=web_share",
      iosUrl: "https://apps.apple.com/in/app/ownitoo/id6448990297",
      featured: false,
      role: "Cross-Platform Developer",
      problem: "Creating complex auction bidding and co-ownership splitting logic in a mobile marketplace.",
      solution: "Developed real-time bidding counters, co-ownership smart workflows, and secure Stripe payment integrations.",
      features: [
        "Fixed-price e-commerce and live auction bidding",
        "Co-ownership fractional asset purchasing workflow",
        "Digital sticker marketplace and trading",
        "Secure checkout with Stripe"
      ],
      architecture: "Provider state management with secure payment gateway bindings."
    ),
    ProjectModel(
      id: "p9",
      title: "Beyond Bags (Cornhole Companion)",
      category: "Flutter",
      description: "A specialized cornhole companion app focused on tracking attempts and scores, converting them into clear charts, averages, streaks, and performance metrics without social clutter.",
      image: "https://images.unsplash.com/photo-1517649763962-0c623066013b?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1517649763962-0c623066013b?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "GetX", "Hive", "SQLite", "Charts (Syncfusion / fl_chart)", "Math & Stats Engine"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.app.beyondBoards",
      iosUrl: "https://apps.apple.com/in/app/beyond-boards-and-bags/id6569248365",
      featured: false,
      role: "Lead Mobile Developer",
      problem: "Providing fast, offline-first statistical data analysis and graph rendering for athletes.",
      solution: "Engineered local Hive database caching with custom statistical algorithms and dynamic chart plotting.",
      features: [
        "Offline-first score and attempt tracking",
        "Advanced performance charts, averages, and streak graphs",
        "Custom statistical calculation engine",
        "Lightweight and lightning-fast local storage"
      ],
      architecture: "GetX controller architecture with local-first Hive storage repository."
    ),
    ProjectModel(
      id: "p10",
      title: "Vigour Media",
      category: "Flutter",
      description: "A comprehensive health and lifestyle content app offering access to eMagazines, online bookings, wellness benefits programs, healthy recipes, guided workouts, podcasts, articles, and health calculators.",
      image: "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "Firebase", "REST APIs"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.app.vigourmedia",
      iosUrl: "https://apps.apple.com/in/app/vigour-media/id6446580465",
      featured: false,
      role: "Flutter Developer",
      problem: "Aggregating diverse wellness media content (magazines, audio podcasts, calculators) into a unified mobile experience.",
      solution: "Built a modular content delivery app with eMagazine PDF readers, podcast streaming, and health calculators.",
      features: [
        "Digital eMagazine reader and wellness articles",
        "Interactive health calculators and workout guides",
        "Healthy recipe database and podcast streaming",
        "Online booking for wellness programs"
      ],
      architecture: "Feature-first clean repository structure with API content caching."
    ),
    ProjectModel(
      id: "p11",
      title: "Whiter Car & Bike Wash (User & Partner)",
      category: "Flutter",
      description: "An on-demand doorstep car and bike cleaning service app featuring live tracking, eco-friendly options, secure Razorpay payments, and dedicated partner management tools.",
      image: "https://images.unsplash.com/photo-1520340356584-f9917d1eea6f?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1520340356584-f9917d1eea6f?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "GetX", "Node.js", "MongoDB", "Google Maps API", "Razorpay", "Hive", "Firebase"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.app.whitler&pcampaignid=web_share",
      iosUrl: "https://apps.apple.com/in/app/whiter-car-bike-wash/id6740070569",
      featured: true,
      role: "Lead Full-Stack Mobile Architect",
      problem: "Coordinating on-demand doorstep vehicle washing with live washer tracking and scheduling.",
      solution: "Built dual apps (Customer & Partner) with live Google Maps tracking, MongoDB backend, and Razorpay payments.",
      features: [
        "On-demand doorstep car and bike wash booking",
        "Live washer tracking on Google Maps",
        "Eco-friendly wash options and subscription plans",
        "Partner assignment and earnings dashboard"
      ],
      architecture: "GetX reactive controllers with MongoDB and Firebase real-time sync."
    ),
    ProjectModel(
      id: "p12",
      title: "Tahda Baby",
      category: "Flutter",
      description: "A specialized platform connecting families with culturally sensitive, empathetic professionals throughout fertility, pregnancy, and birthing journeys, ensuring holistic support.",
      image: "https://images.unsplash.com/photo-1555252333-9f8e92e65df9?auto=format&fit=crop&w=1200&q=80",
      screenshots: [
        "https://images.unsplash.com/photo-1555252333-9f8e92e65df9?auto=format&fit=crop&w=800&q=80"
      ],
      technologies: ["Flutter (Dart)", "GetX", "Node.js", "MongoDB", "Razorpay", "WebRTC", "Firebase"],
      platforms: ["Android", "iOS"],
      gitLabUrl: "https://gitlab.com/princedev.freelance",
      androidUrl: "https://play.google.com/store/apps/details?id=com.app.thadababy",
      iosUrl: "https://apps.apple.com/in/app/tahda-baby/id6673907786",
      featured: false,
      role: "Senior Mobile Architect",
      problem: "Providing secure, HIPAA-compliant telehealth consultations for pregnancy and fertility care.",
      solution: "Integrated WebRTC video consultations, secure messaging, and Razorpay appointment bookings.",
      features: [
        "Culturally sensitive pregnancy and fertility care matching",
        "Secure one-on-one video consultations via WebRTC",
        "Appointment scheduling and milestone tracking",
        "Encrypted messaging and resource library"
      ],
      architecture: "GetX architecture with WebRTC video signaling and MongoDB backend."
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
    SkillModel(name: "Riverpod", category: "Architecture", level: "Primary", iconName: "layers"),
    SkillModel(name: "Provider", category: "Architecture", level: "Primary", iconName: "layers"),
    SkillModel(name: "GetX", category: "Architecture", level: "Advanced", iconName: "layers"),
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
