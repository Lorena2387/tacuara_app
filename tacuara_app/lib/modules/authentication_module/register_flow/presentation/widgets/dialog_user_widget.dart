class UserRepositoryException implements Exception {
  final String message;

  UserRepositoryException(this.message);

  @override
  String toString() {
    return 'UserRepositoryException: $message';
  }
}
