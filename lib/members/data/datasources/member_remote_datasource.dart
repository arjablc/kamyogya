// ignore: unused_import
import '../../../core/constants/api_constants.dart';
import '../../../core/network/network_services.dart';
import '../../domain/entities/member_entity.dart';
import '../model/member_model.dart';

class MemberRemoteDataSource {
  final NetworkServices remoteService;

  const MemberRemoteDataSource({required this.remoteService});
  Future<List<Member>> getMemberList(String url) async {
    final response = await remoteService.getRequest(url);
    final list = (response.data["data"]["members"] as List)
        .map(
          (e) => MemberModel.fromJson(e),
        )
        .toList();

    return list;
  }
}
