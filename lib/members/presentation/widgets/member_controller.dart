import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context.dart';
import '../bloc/member_bloc.dart';

class MemberController extends StatefulWidget {
  const MemberController({super.key});

  @override
  State<MemberController> createState() => _MemberControllerState();
}

class _MemberControllerState extends State<MemberController> {
  final TextEditingController _controller = TextEditingController();

  void addEvent(value) {
    debugPrint(value);
    context.read<MemberBloc>().add(GetMembers(url: value));
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: (value) => _controller.text = value,
          onSubmitted: (value) => addEvent(value),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: context.width,
          child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => addEvent(_controller.text),
              child: Text("Done", style: context.textTheme.titleLarge)),
        )
      ],
    );
  }
}
