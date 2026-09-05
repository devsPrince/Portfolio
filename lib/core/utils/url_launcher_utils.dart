import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AppLinkLauncher {
  Future<void> launch(String urlString);
  Future<void> launchEmail(String email);
}

class AppLinkLauncherImpl implements AppLinkLauncher {
  @override
  Future<void> launch(String urlString) async {
    if (urlString.startsWith("[") && urlString.endsWith("]")) return;
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch $urlString');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Project Inquiry / Opportunity&body=Hi,%0D%0A%0D%0AI would like to discuss...',
    );
    try {
      await launchUrl(emailUri);
    } catch (e) {
      debugPrint('Error launching email: $e');
    }
  }
}
