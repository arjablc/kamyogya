import "package:get_it/get_it.dart";
import "package:internet_connection_checker/internet_connection_checker.dart";

import "../../members/data/datasources/member_remote_datasource.dart";
import "../../members/data/repository/member_repository_impl.dart";
import "../../members/domain/repository/member_repository.dart";
import "../../members/domain/usecases/get_member_list.dart";
import "../../members/presentation/bloc/member_bloc.dart";
import "../network/network_info.dart";
import "../network/network_services.dart";
import "../utils/url_validator.dart";

final sl = GetIt.instance;

void init() {
  //bloc
  sl.registerFactory(() => MemberBloc(getMembersList: sl(), validator: sl()));

  //use case
  sl.registerLazySingleton(() => GetMembersList(repository: sl()));

  //repository
  sl.registerLazySingleton<MemberRepository>(
      () => MemberRepositoryImpl(dataSource: sl()));
  // ds
  sl.registerLazySingleton(() => MemberRemoteDataSource(remoteService: sl()));
//core
  sl.registerLazySingleton(() => NetworkServices(sl()));
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => Validator());

//externals
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
