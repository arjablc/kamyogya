import "package:internet_connection_checker/internet_connection_checker.dart";

abstract class NetworkInfo {
  Future<bool> get hasConnection;
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl({required this.connectionChecker});

  @override
  Future<bool> get hasConnection => connectionChecker.hasConnection;
}
