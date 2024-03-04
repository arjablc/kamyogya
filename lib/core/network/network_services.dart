import "package:dio/dio.dart";

import "../constants/app_strings.dart";
import "../errors/exceptions/remote_exception.dart";
import "network_info.dart";

class NetworkServices {
  final Dio _dio;
  NetworkInfo networkInfo;

  NetworkServices(this.networkInfo) : _dio = Dio();

  Future<Response> getRequest(String url) async {
    final isConnected = await networkInfo.hasConnection;
    if (!isConnected) {
      throw (RemoteException(message: AppStrings.noInternet));
    }
    final response = await _dio.get(url);

    switch (response.statusCode) {
      case 200:
        if (response.data["message"] != "success") {
          throw (RemoteException(message: AppStrings.badRequest));
        }
        return response;
      case 400:
        throw (RemoteException(message: AppStrings.badRequest));
      default:
        throw (RemoteException(message: AppStrings.internalServer));
    }
  }
}
