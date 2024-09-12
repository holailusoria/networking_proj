import 'package:get_it/get_it.dart';
import '../../data/repositories/dio_client.dart';
import '../../data/repositories/user_data_sender.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<UserDataSender>(() => UserDataSender.instance);
}