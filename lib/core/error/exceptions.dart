class ServerException implements Exception {
  final String message;
  const ServerException([this.message = 'Server Error occurred']);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException([this.message = 'Network connection failed']);
}

class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'Cache error occurred']);
}

class ValidationException implements Exception {
  final String message;
  const ValidationException([this.message = 'Validation failed']);
}
