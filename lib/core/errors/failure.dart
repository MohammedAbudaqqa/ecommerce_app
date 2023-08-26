abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.errMessage);
}

class OfflineFailure extends Failure {
  OfflineFailure(super.errMessage);
}

class Success extends Failure {
  Success(super.errMessage);
}
