sealed class Failure {
  final String message;

  const Failure({required this.message});
}

class RemoteFailure extends Failure {
  const RemoteFailure({
    required super.message,
  });
}

class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
  });
}
