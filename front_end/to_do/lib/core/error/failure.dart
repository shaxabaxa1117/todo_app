abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}

class AuthFailure extends Failure {
  AuthFailure(super.message);
}


class MapFailure extends Failure {
  MapFailure(super.message);
}