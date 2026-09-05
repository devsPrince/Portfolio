import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  static Future<void> launchURL(String urlString) async {
    if (urlString.startsWith("[") && urlString.endsWith("]")) return; // Placeholder
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch $urlString');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  static Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Project Inquiry / Opportunity&body=Hi [YOUR NAME],%0D%0A%0D%0AI would like to discuss...',
    );
    try {
      await launchUrl(emailUri);
    } catch (e) {
      debugPrint('Error launching email: $e');
    }
  }
}
