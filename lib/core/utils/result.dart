typedef AsyncResult<T> = Future<Result<T>>;

sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success._;
  const factory Result.failure(Object error) = Failure._;
}

final class Success<T> extends Result<T> {
  const Success._(this.value);
  final T value;
}

final class Failure<T> extends Result<T> {
  const Failure._(this.error);
  final Object error;
}
