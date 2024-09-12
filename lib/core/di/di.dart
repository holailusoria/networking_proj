import 'package:get_it/get_it.dart';
import 'package:networking_proj/domain/use_cases/send_user_data_use_case.dart';
import '../../data/repositories/dio_client.dart';
import '../../data/repositories/user_data_sender.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<UserDataSender>(() => UserDataSender.instance);
  getIt.registerLazySingleton<SendUserDataUseCase>(() => SendUserDataUseCase(getIt<UserDataSender>()));
}