import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions/remote_exception.dart';
import '../../../core/errors/failures/failures.dart';
import '../../domain/entities/member_entity.dart';
import '../../domain/repository/member_repository.dart';
import '../datasources/member_remote_datasource.dart';

class MemberRepositoryImpl extends MemberRepository {
  final MemberRemoteDataSource dataSource;

  MemberRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, List<Member>>> getMemberList(String url) async {
    try {
      final response = await dataSource.getMemberList(url);
      return Right(response);
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(message: e.message),
      );
    }
  }
}
