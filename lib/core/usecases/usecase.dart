import 'package:dartz/dartz.dart' show Either;

import '../errors/failures/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}
