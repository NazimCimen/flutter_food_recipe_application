class ServerException implements Exception {}

class CacheException implements Exception {
  CacheException(this.description);
  final String? description;
}

class AppVersionException implements Exception {
  AppVersionException(this.description);

  final String description;
  @override
  String toString() {
    return '$this $description';
  }
}
