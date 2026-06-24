import 'package:dio/dio.dart';
import 'package:e_commerce/core/networking/api_service.dart';
import 'package:e_commerce/core/networking/dio_factory.dart';
import 'package:e_commerce/features/login/data/repos/login_repo.dart';
import 'package:e_commerce/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt()),
  );
}
