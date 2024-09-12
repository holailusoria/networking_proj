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

    var response = await _dioClient.dio.post('/api/submit', data: userData);

    return {
      'data': response.data,
      'statusCode': response.statusCode,
    };
  }
}