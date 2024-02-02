abstract class Failure {
  const Failure();
}

final class LowWallateBalanceFailure extends Failure {
  final String? msg;

  const LowWallateBalanceFailure({this.msg});
}
