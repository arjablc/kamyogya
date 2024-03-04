part of 'member_bloc.dart';

sealed class MemberState extends Equatable {
  const MemberState();

  @override
  List<Object> get props => [];
}

final class MemberInitial extends MemberState {}

final class MemberListLoaded extends MemberState {
  final List<Member> fetchedList;
  final int itemCount;
  @override
  List<Object> get props => [itemCount];
  const MemberListLoaded(this.itemCount, {required this.fetchedList});
}

final class MemberLoading extends MemberState {}

final class MemberListError extends MemberState {
  final Failure failure;

  const MemberListError({required this.failure});
}
