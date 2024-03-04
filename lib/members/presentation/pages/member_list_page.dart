import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/member_bloc.dart';
import '../widgets/member_detail_card.dart';

class MemberListPage extends StatelessWidget {
  const MemberListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is MemberListLoaded) {
            return ListView.builder(
                itemCount: state.itemCount,
                itemBuilder: (context, index) => MemberDetails(
                    name: state.fetchedList[index].name,
                    imageUrl: state.fetchedList[index].image,
                    club: state.fetchedList[index].club));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
