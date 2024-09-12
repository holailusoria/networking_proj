import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:networking_proj/core/constants/api_constants.dart';

class DioClient {
  final Dio dio;
  final DioAdapter _dioAdapter;

  factory DioClient() {
    var dioClient = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
        )
    );

    dioClient.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        await Future.delayed(const Duration(seconds: 2));
        return handler.next(options);
      },
    ));

    var adapter = DioAdapter(dio: dioClient);

    adapter.onPost(
      '/api/submit',
          (server) =>
          server.reply(200, {
            'username': 'John Doe',
            'email': 'test@test.com',
            'phone': '1234567890'
          }),
    );

    return DioClient._(dioClient, adapter);
  }

  DioClient._(this.dio, this._dioAdapter);
}