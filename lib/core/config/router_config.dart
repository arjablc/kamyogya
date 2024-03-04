import 'package:flutter/material.dart';

import '../../members/presentation/pages/homepage.dart';
import '../../members/presentation/pages/member_list_page.dart';
import '../errors/failures/failures.dart';
import '../presentation/pages/error_page.dart';

class AppRoutes {
  static const homeRoute = "/";
  static const memberList = "/member_list";
  static const error = "/error_page";
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case memberList:
        return MaterialPageRoute(builder: (_) => const MemberListPage());
      case error:
        return MaterialPageRoute(
            builder: (_) => ErrorPage(failure: settings.arguments as Failure));
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
