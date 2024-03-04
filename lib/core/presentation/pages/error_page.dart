import 'package:flutter/material.dart';
import '../../extensions/context.dart';

import '../../errors/failures/failures.dart';

class ErrorPage extends StatelessWidget {
  final Failure failure;
  const ErrorPage({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: context.height * 0.3,
            width: context.width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    failure.message,
                    style: context.textTheme.headlineMedium,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
