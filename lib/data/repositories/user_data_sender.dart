import '../../data/repositories/dio_client.dart';

final class UserDataSender {
  static UserDataSender instance = UserDataSender._();
  final DioClient _dioClient = DioClient();

  UserDataSender._();

  Future<Map<String, dynamic>> sendUserData(String username, String email,
      String phone) async {
    var userData = <String, String>{
      'username': username,
      'email': email,
      'phone': phone,
    };

    _setupMockAdapter(username, email, phone);
    var response = await _dioClient.dio.post('/api/submit', data: userData);

    return {
      'data': response.data,
      'statusCode': response.statusCode,
    };
  }

  _setupMockAdapter(String username, String email, String phone) {
    _dioClient.dioAdapter.onPost(
        '/api/submit',
            (server) {
          return server.reply(200, {
            'statusCode': 200,
            'message': 'Success'
          });
        },
        data: {
          'username': username,
          'email': email,
          'phone': phone,
        }
    );
  }
}