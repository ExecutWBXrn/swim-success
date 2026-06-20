/// Failure interface
sealed class Failure {
  /// init
  Failure({this.code, this.message});

  /// code
  final int? code;

  /// message
  final String? message;
}

/// Failure of server
class ServerFailure extends Failure {
  /// init
  ServerFailure({super.code, super.message});
}

/// Cache failure
class CacheFailure extends Failure {
  /// init
  CacheFailure({super.message});
}

/// Network error
class NetworkFailure extends Failure {
  /// init
  NetworkFailure() : super(message: 'No internet connection');
}
