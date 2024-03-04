import 'package:dartz/dartz.dart';

import '../../../core/errors/failures/failures.dart';
import '../entities/member_entity.dart';

abstract class MemberRepository {
  Future<Either<Failure, List<Member>>> getMemberList(String url);
}
