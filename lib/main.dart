import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/notifications/notification.dart';

import 'core/config/router_config.dart';
import 'core/dl/injector.dart' as di;
import 'members/presentation/bloc/member_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationUtil.init();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MemberBloc>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
