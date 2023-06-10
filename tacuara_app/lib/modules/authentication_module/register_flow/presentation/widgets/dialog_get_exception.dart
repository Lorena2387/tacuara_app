class GetUserException implements Exception {
  final String message;
  GetUserException(this.message);

  @override
  String toString() {
    return 'GetUserException: $message';
  }
}
