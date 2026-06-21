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
  ServerFailure({super.code}) : super(message: 'Server failure');
}

/// Client error
class ClientFailure extends Failure {
  /// init
  ClientFailure({super.code}) : super(message: 'Client failure');
}

class NetworkFailure extends Failure {
  /// init
  NetworkFailure({super.code}) : super(message: 'Network failure');
}
