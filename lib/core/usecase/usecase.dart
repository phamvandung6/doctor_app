
abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();

  Future<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();

  Future<Type> call();
}

abstract class UseCaseWithoutParamsStream<Type> {
  const UseCaseWithoutParamsStream();

  Stream<Type> call();
}

abstract class UseCaseWithParamsStream<Type, Params> {
  const UseCaseWithParamsStream();

  Stream<Type> call(Params params);
}