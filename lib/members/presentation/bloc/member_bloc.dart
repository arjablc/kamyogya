import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/notifications/notification.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/url_validator.dart';
import '../../domain/usecases/get_member_list.dart';

import '../../../core/errors/failures/failures.dart';
import '../../domain/entities/member_entity.dart';

part 'member_events.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final GetMembersList getMembersList;
  final Validator validator;

  MemberBloc({required this.validator, required this.getMembersList})
      : super(MemberInitial()) {
    on<GetMembers>((event, emit) async {
      emit(MemberLoading());
      if (!validator.validateUrl(event.url) || event.url.isEmpty) {
        return emit(const MemberListError(
            failure: ValidationFailure(message: AppStrings.validationError)));
      }
      final result = await getMembersList(event.url);
      await result.fold((l) async {
        return emit(
          MemberListError(
            failure: l,
          ),
        );
      }, (r) async {
        for (int i = 1; i < 4; i++) {
          emit(MemberListLoaded(i, fetchedList: r));
          await Future.delayed(const Duration(seconds: 5));
        }
        await LocalNotificationUtil.showNotification(
            title: "shceduled notification",
            body: DateTime.now().toString(),
            payload: "Just a notification");
      });
    });
  }
}
