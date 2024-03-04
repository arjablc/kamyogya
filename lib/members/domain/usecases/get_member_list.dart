import 'package:dartz/dartz.dart' show Either;

import '../../../core/errors/failures/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/member_entity.dart';
import '../repository/member_repository.dart';

class GetMembersList extends UseCase<List<Member>, String> {
  final MemberRepository repository;
  GetMembersList({required this.repository});
  @override
  Future<Either<Failure, List<Member>>> call(String param) =>
      repository.getMemberList(param);
}
