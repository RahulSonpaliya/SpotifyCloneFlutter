class Failure {
  final int statusCode;
  final String message;

  Failure(
    this.statusCode,
    this.message,
  );
}

class SessionExpiry extends Failure {
  SessionExpiry(
    super.statusCode,
    super.message,
  );
}

class AppVersionUpdate extends Failure {
  AppVersionUpdate(
    super.statusCode,
    super.message,
  );
}

class ServerError extends Failure {
  ServerError(
    super.statusCode,
    super.message,
  );
}

class TimeoutError extends Failure {
  TimeoutError(
    super.statusCode,
    super.message,
  );
}

class UnknownError extends Failure {
  UnknownError(
    super.statusCode,
    super.message,
  );
}

class NoInternetError extends Failure {
  NoInternetError(
    super.statusCode,
    super.message,
  );
}
