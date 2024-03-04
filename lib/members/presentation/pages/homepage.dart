import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/router_config.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/extensions/context.dart';
import '../bloc/member_bloc.dart';
import '../widgets/member_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<MemberBloc, MemberState>(
              listener: (context, state) {
                if (state is MemberListLoaded) {
                  Navigator.pushNamed(context, AppRoutes.memberList);
                } else if (state is MemberListError) {
                  Navigator.pushNamed(context, AppRoutes.error,
                      arguments: state.failure);
                }
                return;
              },
              listenWhen: (previous, current) =>
                  (previous is! MemberListLoaded),
              builder: (context, state) {
                if (state is MemberLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return _buildMainSection(context);
              }),
        ));
  }

  Widget _buildMainSection(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
                flex: 3,
                child: Text(ApiEndpoints.searchMemberUrl,
                    textAlign: TextAlign.justify,
                    style: context.textTheme.bodyLarge)),
            Flexible(
              flex: 1,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Clipboard.setData(
                      const ClipboardData(text: ApiEndpoints.searchMemberUrl),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(AppStrings.clipboardCopy)));
                  },
                  child: Text(
                    "Copy",
                    style: context.textTheme.bodyLarge,
                  )),
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          const MemberController()
        ]);
  }
}
