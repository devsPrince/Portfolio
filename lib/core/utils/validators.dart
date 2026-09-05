class Validators {
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidName(String name) {
    return name.trim().isNotEmpty && name.trim().length >= 2;
  }

  static bool isValidMessage(String message) {
    return message.trim().isNotEmpty && message.trim().length >= 5;
  }

  static bool isValidUrl(String url) {
    if (url.startsWith('[') && url.endsWith(']')) return true; // Placeholder
    final uri = Uri.tryParse(url);
    return uri != null && (uri.isScheme('http') || uri.isScheme('https'));
  }
}
