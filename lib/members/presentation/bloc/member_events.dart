part of 'member_bloc.dart';

sealed class MemberEvent extends Equatable {
  const MemberEvent();

  @override
  List<Object> get props => [];
}

class GetMembers extends MemberEvent {
  final String url;

  const GetMembers({required this.url});
}
