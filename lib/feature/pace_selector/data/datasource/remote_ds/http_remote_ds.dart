import 'package:fpdart/fpdart.dart';
import 'package:swim_success/core/failure/failure.dart';

/// Http remote ds
abstract interface class HttpRemoteDs {
  /// post request
  Future<Either<Failure, void>> postRequest(int seconds);
}
