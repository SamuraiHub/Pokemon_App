// for failures and error messages
abstract class Failure {
  final String message;
  const Failure(this.message);
}

// server failure
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

// connection failure
class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

// database failure
class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}
